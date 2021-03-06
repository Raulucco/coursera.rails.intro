class Recipe
  include HTTParty

  key_value = ENV["FOOD2FORK_KEY"]
  hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] || 'food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for search_term
    get("/search", query: {q: search_term})["recipes"]
  end
end
