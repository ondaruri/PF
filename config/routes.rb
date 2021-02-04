Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'

  resources :shops, only: [:index, :show]

  resources :post_ramens, only: [:show, :edit, :new, :update, :destroy, :create] do
    resources :post_comments, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :clips, only:[:index, :create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :follows, :follower
    end
  end


  post 'follow/:id' => 'relationships#follow', as: 'follow' #フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' #フォロー外す

  get 'users/my_page'
  get 'post_ramens/search'
  get 'homes/top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
