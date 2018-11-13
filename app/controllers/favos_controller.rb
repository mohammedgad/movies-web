class FavosController < ApplicationController
  def index
    if session[:user_token].present?
      h = HTTParty.get("http://0.0.0.0:3001/favos", headers: {
       "Authorization" => "Bearer #{session[:user_token]}",
           "cache-control" => "no-cache"
        })
      @r = JSON.parse(h.body)
    end
  end

  def create
  end

  def destroy
  end
end
