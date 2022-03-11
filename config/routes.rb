Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)
  resources :follow_relationships, only: [:create, :destroy]
  get '/users/:id/followings', to: 'follow_relationships#followings'
  get '/users/:id/followers', to: 'follow_relationships#followers'
end
