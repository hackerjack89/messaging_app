Rails.application.routes.draw do
  root 'home#index'
  post '/forward_message', to: 'home#forward_message'
end
