require 'rubygems'
require 'bundler/setup'
require 'celluloid'

class Scene
  include Celluloid
  def initialize(options={})
    @people = []
    initial_population = options.fetch(:initial_population){ 1 }
    initial_population.times do |i|
      @people << Person.new("Random #{i}")
    end
  end

  def run
    futures = @people.map do |person|
      person.future(:live_out_life)
    end

    # Get the values from each future so that we don't end the script before
    # everyone's dead.
    futures.map(&:value)
  end
end
