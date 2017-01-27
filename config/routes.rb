Rails.application.routes.draw do

  # match any HTTP GET Request for the URL /pictures to the index action in the PicturesController"
  get 'pictures' => 'pictures#index'

end
