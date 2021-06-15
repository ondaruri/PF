Rails.application.routes.draw do

  get 'messages/create'
  get 'rooms/index'
  get 'rooms/create'
  get 'rooms/show'
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'post_ramens/index'
    get 'post_ramens/show/:post_ramen_id', to: 'post_ramens#show', as: :post_ramen_show
    get 'post_ramens/create'
    get 'post_ramens/edit'
    patch 'post_ramens/update'
    delete 'post_ramens/destroy/:id', to: 'post_ramens#destroy'
  end

 namespace :admins do
  delete 'post_ramens/post_comments/destroy/:post_ramen_id/:post_comment_id', to: 'post_comments#destroy', as: :post_comment_destroy
 end


  namespace :admins do
    get 'users/index'
    get 'users/edit'
    get 'users/search', to: 'users#search', as: :user_search
    get 'users/show/:user_id', to: 'users#show', as: :user_show
    patch 'users/update'
    delete 'users/destroy/:user_id', to: 'users#destroy', as: :users_destroy
  end


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

  resources :users, only: [:show,:edit,:update]
  resources :messages, only: [:create]
  resources :rooms, only: [:create]
  get 'rooms/show/:room_id', to: 'rooms#show', as: :room_show


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
