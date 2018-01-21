module DB
  class Connection
    def transaction
      yield File.open("db/post_metrics.json", "w")
    end
  end
end
