require 'rubygems'
require 'bundler/setup'
require 'celluloid'

# A Person can live, get older, and die.
# One would assume that reproduction can happen after a while, given that
# other folks exist.
class Person
  include Celluloid

  def self.max_age
    75
  end

  # State machine to manage lifecycle
  class Machine
    include Celluloid::FSM

    default_state :birthed

    state :birthed, :to => [:aging] do
      puts "#{actor.name} has been born!"
    end

    state :living, :to => [:aging]

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
    "#{name}: #{age} years old, #{hair} hair"
  end

  def dead?
    @machine.state == :dead
  end

  def living?
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

  def live_out_life
    while living?
      live_a_little
    end
  end

  # As you get older, the hair changes
  def hair
    case age
    when 1..35
      :brown
    when 36..60
      :gray
    else
      :bald
    end
  end

  def inspect
    "<Person @name=#{@name} @age=#{@age} hair=#{hair}>"
  end
end

if __FILE__ == $0
  josh = Person.new "Josh Adams"
  while josh.living? do
    josh.live_a_little
  end
end
