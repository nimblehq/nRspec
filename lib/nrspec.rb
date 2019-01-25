require 'nrspec/version'
require 'nrspec/connection'
require 'nrspec/measurer'
require 'optparse'
require 'pry'
require 'firebase'

module Nrspec
  def self.build
    build_measurer
  end

  def self.build_measurer
    connection = Connection.new
    Measurer.new(connection).build
  end

  private_class_method :build_measurer
end
