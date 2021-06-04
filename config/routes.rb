Rails.application.routes.draw do

  namespace :admins do
    get 'post_ramens/index'
    get 'post_ramens/show'
    get 'post_ramens/create'
    get 'post_ramens/edit'
    patch 'post_ramens/update'
    delete 'post_ramens/destroy/:post_ramen_id', to: 'post_ramens#destroy'
  end
  namespace :admins do
    get 'users/index'
    get 'users/edit'
    get 'users/show'
    patch 'users/update'
    delete 'users/destroy'
  end
  # devise_for :admins
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'homes#top'
  get 'homes/index'

  resources :shops, only: [:index, :show, :create]
  resources :clips, only:[:index, :create, :destroy]


  resources :post_ramens, only: [:index,:show, :edit, :new, :update, :destroy, :create] do
    resources :post_comments, only: [:create, :show, :update, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :follows, :follower
    end
  end


  post 'follow/:id' => 'relationships#follow', as: 'follow' #フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' #フォロー外す

  # get 'users/:current_user.id' => 'users#mypage', as: 'my_page'
  get 'post_ramens/search'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  # registrations: 'admins/registrations'
}



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
