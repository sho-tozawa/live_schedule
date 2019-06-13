Rails.application.routes.draw do
  resources :live_houses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "login" => "users#login_form"
end
