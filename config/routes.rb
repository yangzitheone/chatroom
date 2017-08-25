Rails.application.routes.draw do
  resources :chatrooms do
    resource :room_users
    resources :chatmessages
  end

  resources :direct_messages
  root   'chatrooms#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


