class MoviesController < ApplicationController
  def index
    if params[:search]
      h = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV["TMDB_API_KEY"]}&query=#{params[:search]}")
      @r = JSON.parse(h.body)
    end
  end
end
