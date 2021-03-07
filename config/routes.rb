Rails.application.routes.draw do
  devise_for :users, controllers: {registration: 'users/registrations',
                                    sessions: 'users/sessions'}
  resources :users, :only => [:index, :show]
  
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :volunteers
  root 'volunteers#index'

 

end
