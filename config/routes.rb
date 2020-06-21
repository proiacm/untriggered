Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => 'callbacks'}

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  root to: 'application#welcome'

  resources :emotions, only: [:index, :show] do 
    resources :entries, only: [:index, :new]
  end

  resources :entries, only: [:index, :new, :create, :show, :edit, :update, :destroy]

end
