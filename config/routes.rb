Rails.application.routes.draw do
  root 'home#index'
  post 'wash_service', to: 'home#wash_service'
end
