Rails.application.routes.draw do
  ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "characters#index"
  resources :characters do
    resources :user_comments
    collection do
      get 'search', to: 'characters#search'
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'

  }
  resources :contacts

end
