require 'nrspec/version'
require 'nrspec/connection'
require 'optparse'
require 'pry'
require 'firebase'

module Nrspec
  def self.build
    # p 'asd'
    # p command = "rspec spec/nrspec_spec.rb"
    # system(command)

    # base_uri = 'https://nrspec-d14ce.firebaseio.com/'
    # firebase = Firebase::Client.new(base_uri)
    # firebase.push("todos", {
    #   :name => 'Pick the milk',
    #   :created => Firebase::ServerValue::TIMESTAMP
    # })
    # response = firebase.get("todos")
    binding.pry


  end
end
