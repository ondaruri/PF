Rails.application.routes.draw do
  get 'clips/index'
  get 'shops/index'
  get 'shops/show'
  get 'post_ramens/show'
  get 'post_ramens/edit'
  get 'post_ramens/new'
  get 'post_ramens/create'
  get 'post_ramens/update'
  get 'post_ramens/destroy'
  get 'post_ramens/search'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
