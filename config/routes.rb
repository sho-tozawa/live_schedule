Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/edit'
  get 'logins/login'
  resources :live_houses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "login" => "logins#login"
  post "login" => "logins#login"
  post "logout" => "logins#logout"

  get "/" => "home#top"
  get "about" => "home#about"
end
