module Posty
  class Job
    def run
      post_data = download_post
      post = parse_data(post_data)
      update_post_metric(post)
    end

    def download_post
      FTP.download(
        "kapost",
        "supersecretpassword",
        "localhost",
        "/ftp/post_archives.yaml") do |post_data|
          return post_data
      end
    end

    def update_post_metric(post)
      post.connection.transaction do |db|
        db.write(post.to_json)
        db.close
      end
    end

    def parse_data(post_data)
      Post.new(YAML.load(post_data))
    end
  end
end
