Rails.application.routes.draw do
  get 'users/show'

  get 'users/edit'

  get 'users/index'

  get 'toppages/root'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#root'
  resources :users
end
