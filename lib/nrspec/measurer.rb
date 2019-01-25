module Nrspec
  class Measurer
    WHOLE_DIRECTORY = '**/*_spec.rb'.freeze

    def initialize(connection)
      @connection = connection
      @remote_resources = connection.get.body.to_a
    end

    def build
      all_spec_files.each do |file_name|
        duration = duration_for(file_name)
        remote_file = find_remote_file(file_name)
        resource = resource_for(file_name, duration)

        if !remote_file.empty?
          connection.update(id: remote_file.first, resource: resource)
        else
          connection.create(resource: resource)
        end
      end
    end

    private

    attr_accessor :connection, :remote_resources

    def all_spec_files
      Dir[WHOLE_DIRECTORY]
        .select { |item| File.file? item }
        .map { |item| File.path item }
    end

    def find_remote_file(file_name)
      remote_resource = remote_resources.select do |remote_resource|
        break remote_resource if remote_resource.last['name'] == file_name
      end

      remote_resource
    end

    def resource_for(file_name, duration)
      {
        name: file_name,
        duration: duration
      }
    end

    def duration_for(file_name)
      starting_time = Time.now
      p command = "bundle exec rspec #{file_name}"
      system(command)
      ending_time = Time.now

      (ending_time - starting_time).ceil
    end
  end
end
