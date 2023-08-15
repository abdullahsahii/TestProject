Rails.application.routes.draw do

  constraints(RoleConstraint.new('admin')) do
    ActiveAdmin.routes(self)
  end
  root "characters#index"
  resources :characters, only: [:index, :show] do
    resources :user_comments, only: [:new, :create, :edit, :update, :destroy]
    collection do
      get 'search', to: "characters#search"
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'

  }
  resources :contacts, only: [:new, :create, :show, :index]
end
