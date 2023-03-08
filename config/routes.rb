Rails.application.routes.draw do
  root 'top#index'
  resources :works
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
