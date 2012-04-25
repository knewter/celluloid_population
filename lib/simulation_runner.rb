require 'rubygems'
require 'bundler/setup'
require 'celluloid'

require File.expand_path("../person.rb", __FILE__)
require File.expand_path("../scene.rb", __FILE__)

# This will run a simulation of a Scene
s = Scene.new(initial_population: 8)
s.run
