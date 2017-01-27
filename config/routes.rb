Rails.application.routes.draw do
  root 'pictures#index'

  get 'pictures/new' => 'pictures#new'
  post 'pictures' => 'pictures#create'

  # match any HTTP GET Request for the URL /pictures to the index action in the PicturesController"
  get 'pictures' => 'pictures#index'
  get 'pictures/:id' => 'pictures#show', as: 'picture'
  # as: "picture", refer to this route as picture_path: the String is prepended to _path

  get 'pictures/:id/edit' => "pictures#edit", as: "edit_picture"
  patch 'pictures/:id' => "pictures#update"
end
