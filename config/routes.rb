Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#root'
  get  'user/signup',  to: 'users#new', as: "signup"
  
  get  'user/login',  to: 'users#new', as: "login"
  post  'user/login',  to: 'users#new'
  delete  'user/logout',  to: 'users#logout', as: "logout"
  resources :users
end
