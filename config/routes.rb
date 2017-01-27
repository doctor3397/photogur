Rails.application.routes.draw do

  # match any HTTP GET Request for the URL /pictures to the index action in the PicturesController"
  get 'pictures' => 'pictures#index'
  get 'pictures/:id' => 'pictures#show', as: 'picture'
  # as: "picture", refer to this route as picture_path: the String is prepended to _path
end
