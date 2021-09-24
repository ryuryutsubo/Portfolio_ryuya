Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'
  get 'ranking' => 'post_images#ranking'

  resources :post_images do

    resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    member do
    get :follows, :followers
    end
  resource :relationships, only: [:create, :destroy]
  end


end
