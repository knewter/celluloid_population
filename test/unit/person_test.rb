require File.expand_path("../../test_helper.rb", __FILE__)

describe Person do
  subject { Person.new("Josh Adams") }
  it "responds to #name" do
    subject.name.must_equal "Josh Adams"
  end
end
