Rails.application.routes.draw do
  get 'toppages/root'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#root'
  resources :users
end
