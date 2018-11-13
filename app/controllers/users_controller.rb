class UsersController < ApplicationController
  before_action :check_logged?, only: [:create,:login]
  def login
  end

  def create_session
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
        redirect_to root_path
      else
        redirect_to user_login_path
      end
    end
  end

  def logout
    session.delete(:user_token)
    flash[:success] = "logged out"
    redirect_to root_path
  end

  def create
  end
end
