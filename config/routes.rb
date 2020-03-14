Rails.application.routes.draw do

  root   'static_pages#home'
  get    '/auth/:provider/callback', to: 'users#facebook_login',
                                     as: :auth_callback
  get    '/auth/failure',            to: 'users#auth_failure',
                                     as: :auth_failure
  get    '/about',                   to: 'static_pages#about'
  get    '/contact',                 to: 'static_pages#contact'
  get    '/signup',                  to: 'users#new'
  post   '/signup',                  to: 'users#create'
  patch  '/users/:id/edit',          to: 'users#update'
  get    '/users/:id/password/edit', to: 'users#password_edit'
  patch  '/users/:id/password/edit', to: 'users#password_update'
  get    '/login',                   to: 'sessions#new'
  post   '/login',                   to: 'sessions#create'
  delete '/logout',                  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts,         only: [:show, :new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :likes,         only: [:create, :destroy]
  resources :comments,      only: [:create, :destroy]
end
