require File.expand_path("../../test_helper.rb", __FILE__)

describe Person do
  subject { Person.new("Josh Adams") }
  it "has a name" do
    subject.name.must_equal "Josh Adams"
  end

  describe "states" do
    it "starts out alive" do
      subject.alive?.must_equal true
    end

    it "gets old" do
      subject.age = Person.max_age + 1
      subject.too_old?.must_equal true
    end

    it "dies" do
      subject.machine.expects(:state).returns(:dead)
      subject.dead?.must_equal true
    end
  end

  describe "hair" do
    it "starts out bald" do
      subject.hair.must_equal :bald
    end

    it "gets brown" do
      subject.age = 2
      subject.hair.must_equal :brown
    end

    it "goes gray" do
      subject.age = 52
      subject.hair.must_equal :gray
    end

    it "ends up bald" do
      subject.age = 62
      subject.hair.must_equal :bald
    end
  end
end
