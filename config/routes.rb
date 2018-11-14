Rails.application.routes.draw do
  root 'movies#index'
  get 'favos', to: "favos#index", as: "favos"
  post 'favos/create'
  post 'favos/destroy'
  get 'logout', to: "users#logout", as: "logout"
  get 'login', :to => "users#login", :as => "user_login"
  get 'signup', :to => "users#signup", :as => "user_signup"
  post 'users/create_user'
  post 'users/create_session'
  get 'movies/index', :as => "movies"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
