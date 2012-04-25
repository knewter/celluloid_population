## Population Modeling with Celluloid
This is a testbed for me to learn celluloid / actor-based programming paradigms.
I'd like to build a little simulation where each person in the population is
their own actor, handling their own lifecycle, and they live/die based on
functions that use population as input (really generic explanation of basic
population modeling here)

### Architecture

#### Person
So yeah, a population consists of a bunch of people (instances of the Person
class).  People do the following:

- get old
- go bald
- die

#### Scene
A scene manages all of the people in the simulation.

### Development
To run the tests:

    gem install bundler
    bundle
    bundle exec guard
    # hit enter
