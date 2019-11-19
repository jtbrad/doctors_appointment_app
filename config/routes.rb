Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  root "users#show"

  resources :doctors

  resources :users do
    resources :appointments
  end

end
