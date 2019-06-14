Rails.application.routes.draw do
  resources :live_houses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "users#login_form"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
end
