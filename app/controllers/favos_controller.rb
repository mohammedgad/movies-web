class FavosController < ApplicationController
  def index
    if session[:user_token].present?
      h = HTTParty.get("http://0.0.0.0:3001/favos", headers: {
       "Authorization" => "Bearer #{session[:user_token]}",
           "cache-control" => "no-cache"
        })
      @r = JSON.parse(h.body)
    else
      redirect_to user_login_path
    end
  end

  def create
    if session[:user_token].present? && params[:movie_id]
      h = HTTParty.post("http://0.0.0.0:3001/favos", headers: {
       "Authorization" => "Bearer #{session[:user_token]}",
           "cache-control" => "no-cache"
        }, body: {
        	"favo" => {
        		"movie_id" => params[:movie_id],
        		"movie_poster" => params[:movie_poster],
        		"movie_overview" => params[:movie_overview],
        		"movie_title" => params[:movie_title],
        	}
        })
      if h
        respond_to do |format|
          format.js {render inline: "alert('#{h["movie_title"]} add to your Favos')" }
        end
      end
    end
  end

  def destroy
    if session[:user_token].present? && params[:favo_id]
      h = HTTParty.delete("http://0.0.0.0:3001/favos/#{params[:favo_id]}", headers: {
       "Authorization" => "Bearer #{session[:user_token]}",
           "cache-control" => "no-cache"
        })
      redirect_back(fallback_location: root_path)
    end
  end
end
