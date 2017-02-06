Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  root 'pictures#index'

  resources :pictures
  resource :users, only: [:new, :create]
  # match any HTTP GET Request for the URL /pictures to the index action in the PicturesController"
  # get 'pictures' => 'pictures#index'
  # get 'pictures/new' => 'pictures#new'
  #
  # get 'pictures/:id/edit' => "pictures#edit", as: "edit_picture"
  # post 'pictures' => 'pictures#create'
  #
  # get 'pictures/:id' => 'pictures#show', as: 'picture'
  # # as: "picture", refer to this route as picture_path: the String is prepended to _path
  # patch 'pictures/:id' => "pictures#update"
  #
  # delete 'pictures/:id' => 'pictures#destroy', as: "delete_picture"
end
