
require "spec_helper"

RSpec.describe Posty::Post do

  let(:attrs) do
    {
      title: "Marketing 101",
      view_count: 4,
      total_impact: 8
    }
  end

  subject { described_class.new(attrs) }

  it "has a title" do
    expect(subject.title).to eq "Marketing 101"
  end

  it "has a view count" do
    expect(subject.view_count).to eq 4
  end

  it "has a total impact rating" do
    expect(subject.total_impact).to eq 8
  end

  describe "#reach" do
    it "returns a calculation that is a funciton of view count and total impact" do
      expect(subject.reach).to eq 32
    end
  end

  describe "#connection" do
    it "returns a database connection" do
      expect(subject.connection).to be_instance_of(DB::Connection)
    end
  end
end
