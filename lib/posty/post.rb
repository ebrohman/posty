require "posty/db/connection"
require "json"

module Posty
  class Post
    attr_reader :title, :view_count, :total_impact

    def initialize(attrs)
      @title         = attrs[:title]
      @view_count    = attrs[:view_count] || 0
      @total_impact  = attrs[:total_impact] || 0
    end

    def reach
      view_count * total_impact
    end

    def connection
      DB::Connection.new
    end

    def to_json
      JSON.generate(
        title: title,
        reach: reach
      )
    end
  end
end

