Rails.application.routes.draw do
  devise_for :users
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :articles
  post  'articles' => 'articles#create'
  resources :users, only: :show
  root 'articles#index'
  post "likes/:article_id/create" => "likes#create"
  post "likes/:article_id/destroy" => "likes#destroy"
  get "users/:id/likes" => "users#likes"

end
