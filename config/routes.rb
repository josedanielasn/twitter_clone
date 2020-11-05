Rails.application.routes.draw do
  devise_for :users

  resources :user, only: %i[index show] do
    resources :twits, only: %i[create show destroy]
    member do
      get 'follower_index', controller: 'follow'
      get 'following_index', controller: 'follow'
      post 'follow', controller: 'follow'
      delete 'unfollow', controller: 'follow'
    end
  end
  
  resources :twits, only: [] do
    member do
      post 'retwit'
      delete 'unretwit'
      get 'new_reply'
      post 'create_reply'
    end
  end

  resources :notification, only: [:index] do
    member do
      patch 'read'
    end
  end

  resources :hashtag, only: [:show]

  root 'home#index'
end
