Rails.application.routes.draw do
  resources :live_houses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  collection do
    login :login_form
  end
end
