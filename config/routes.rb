Rails.application.routes.draw do
  ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "characters#index"
  resources :characters do
    resources :comments
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations', # Custom registrations controller
    sessions: 'users/sessions'
  }

end
