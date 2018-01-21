require "spec_helper"

RSpec.describe DB::Connection do
  subject { described_class.new }

  it { expect { subject }.not_to raise_error }

  describe "#transaction" do
    it "yields a write source" do
      subject.transaction do |db|
        expect(db).to be_a(File)
      end
    end
  end
end
