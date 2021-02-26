Rails.application.routes.draw do
  devise_for :sellers, controllers: {
    sessions:      'sellers/sessions',
    passwords:     'sellers/passwords',
    registrations: 'sellers/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'address_users', to: 'users/registrations#new_address'
    post 'address_users', to: 'users/registrations#create_address'
  end

  devise_scope :seller do
    get 'address_sellers', to: 'sellers/registrations#new_address'
    post 'address_sellers', to: 'sellers/registrations#create_address'
  end

  resources :my_sellers, only: [:show, :update, :edit]

  resources :my_users, only: [:show, :update, :edit]do
    get :favorites, on: :collection
  end

  resources :searchs, only: [:index]
  get 'searchs/search'

  resources :items, except: :index do
    collection do
      get 'search'
    end
    resources :orders, only: [:index, :create]
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: :create
  end

  root to: "items#index"
end
