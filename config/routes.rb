Rails.application.routes.draw do
  get 'logins/login'
  resources :live_houses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "logins#login"
  get "login" => "logins#login"
  post "login" => "logins#login"
  post "logout" => "users#logout"
end
