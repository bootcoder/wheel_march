Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rides#index'

  resources :users do
    resources :driver_details
  end

  resources :rides
  resources :invitations

  resource :session, :only => [:new, :create, :destroy]

end
