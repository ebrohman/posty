require "spec_helper"

RSpec.describe Posty::FTP do
  let(:post_ary) { [] }

  context "given bad credentials" do
    it "should reject bad credentials" do
      expect do
        described_class.download("napa", "cabbage", "s3", "ftp/post_archives")
      end.to raise_error Posty::FTP::InvalidCreds
    end
  end

  context "given valid credentials" do
    it "should download the file from the server" do
      described_class.download(
        "kapost",
        "supersecretpassword",
        "s3",
        "ftp/post_archives.yaml") { |post|
        expect(post).to match /Marketing 101/
      }
    end
  end
end
