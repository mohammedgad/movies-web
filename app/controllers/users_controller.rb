class UsersController < ApplicationController
  before_action :check_logged?, only: [:create,:login]
  def login
  end

  def signup
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
        flash[:success] = "user logged in"
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

  def create_user
    name = params[:name]
    email = params[:email]
    password = params[:password]
    if email.present? && password.present? && name.present?
      r = HTTParty.post("http://0.0.0.0:3001/users",
                :body => { "user": {
                  :name => name,
                  :email => email,
                  :password => password
                }}.to_json,
                :headers => { 'Content-Type' => 'application/json' })
      if r['created_at'].present?
        flash[:success] = "user created please login"
        redirect_to user_login_path
      else
        flash[:danger] = "something went wrong"
        redirect_to user_signup_path
      end
    end
  end
end
