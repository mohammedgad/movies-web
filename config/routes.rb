Rails.application.routes.draw do
  root 'movies#index'
  get 'login', :to => "users#login", :as => "user_login"
  get 'signup', :to => "users#create", :as => "user_create"
  post 'users/create_session'
  get 'movies/index', :as => "movies"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
