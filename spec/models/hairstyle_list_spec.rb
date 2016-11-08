require "spec_helper"

describe "HairstyleList" do
  it "has a valid factory" do
    expect(FactoryGirl.build(:hairstyle_list)).to be_valid
  end
end
