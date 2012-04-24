require 'rubygems'
require 'bundler/setup'
require 'celluloid'

class Person
  include Celluloid

  def self.max_age
    2
  end

  # State machine to manage lifecycle
  class Machine
    include Celluloid::FSM

    default_state :living

    state :living

    state :aging, :to => [:living, :dead] do
      puts actor
      actor.age += 1
      if actor.too_old?
        transition :dead
      else
        transition :living
      end
    end

    state :dead, :to => [] do
      puts "oops I'm dead"
    end
  end

  def initialize name
    @name = name
    @age  = 0

    @machine = Machine.new
  end

  attr_reader   :name
  attr_accessor :age
  attr_reader   :machine

  def to_s
    "#{name}: #{age} years old"
  end

  def dead?
    @machine.state == :dead
  end

  def alive?
    !dead?
  end

  def live_a_little
    get_older
  end

  def get_older
    return if dead?
    @machine.transition :aging
  end

  def too_old?
    @age > Person.max_age
  end

  def inspect
    "<Person @name=#{@name} @age=#{@age}>"
  end
end

if __FILE__ == $0
  puts 'making josh'
  p = Person.new "Josh Adams"
  while p.alive? do
    puts p
    puts p.alive?
    p.live_a_little
  end
end
