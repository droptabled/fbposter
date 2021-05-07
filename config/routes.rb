Rails.application.routes.draw do
  resources :comments
  resources :improvements
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
