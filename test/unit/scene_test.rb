require File.expand_path("../../test_helper.rb", __FILE__)

describe Scene do
  subject { Scene.new }
  it "can be initialized" do
    subject.must_be_kind_of Scene
  end
end
