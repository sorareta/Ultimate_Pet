Rails.application.routes.draw do
  

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  

  

  root to: "welcome#index"

 

 
  resources :pets, defaults: {format: 'html'}

end
