Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get 'about/show'

  get 'home/show'
  root 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
