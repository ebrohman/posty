require "yaml"

module Posty
  CREDS = ["kapost", "supersecretpassword"].freeze

  class FTP
    class InvalidCreds < StandardError; end
    # eliminate argument order dependency later
    def self.download(user, password, host, file)
      raise InvalidCreds unless (CREDS - [user, password]).empty?

      puts "downloading file...\n\n"

      sleep ENV["SLEEP"].to_i || 0.5

      yield IO.binread(File.expand_path("../../#{file}", File.dirname(__FILE__)))
    end
  end
end
