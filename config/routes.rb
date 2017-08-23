Rails.application.routes.draw do
  get 'chat/index'

  get 'chatmessage/index'

  get 'chatmessage/show'

  get 'chatmessage/update'

  get 'chatmessage/distroy'

  post 'chatmessage/join'

  root  'chat#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


