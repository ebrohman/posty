require "spec_helper"

RSpec.describe Posty::Job do
  subject { described_class.new }

  describe "#download_post" do
    it "downloads the archived post data from the server" do
      raw_data = subject.download_post
      post_data = YAML.load(raw_data)
      expect(post_data["title"]).to eq("Marketing 101")
    end
  end

  describe "update_post_metric" do
    let(:post) do
      Posty::Post.new({title: "Marketing 101", view_count: 7, total_impact: 3})
    end

    it "replaces the old post metrics with the new metrics in the database" do
      subject.update_post_metric(post)

      file = File.read("db/post_metrics.json")
      json = JSON.parse(file, object_class: OpenStruct )

      expect(json.title).to eq "Marketing 101"
      expect(json.reach).to eq 21
    end
  end
end


# what if the host/login/password changes to the FTP server or AWS instance?

# what if I need to create another Job like this one?

# what if I don't want to download the file every time I run the test
