class UsersController < ApplicationController
  def login
    email = params[:email]
    password = params[:password]
    if email.present? && password.present?
      r = HTTParty.post("http://0.0.0.0:3001/user_token",
                :body => { "auth": {
                  :email => email,
                  :password => password
                }}.to_json,
                :headers => { 'Content-Type' => 'application/json' })
      if r['jwt'].present?
        session[:user_token] = r['jwt']
        flash[:success] = "user loged in"
      end
    end
  end

  def logout
    session[:user_token] = ""
  end

  def create
  end
end
