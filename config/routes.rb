Rails.application.routes.draw do
  devise_for :users
 resources :rents

  root 'rents#index'
end
