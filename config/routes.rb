Rails.application.routes.draw do

  get '/', to: 'login#index'
  post 'login', to: 'login#login'
  post 'logout', to: 'login#logout'

  resources :users, only:[:show,:index]

  resources :buses do
    resources :bus_stops
    resources :tickets
    post 'tickets/:id', to: 'tickets#update'
  end

  root 'buses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
