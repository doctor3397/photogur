class PicturesController < ApplicationController

  # get 'pictures' => 'pictures#index'
  def index
    @pictures = Picture.all
  end

  #  get 'pictures/:id' => 'pictures#show'
  def show
    @picture = Picture.find(params[:id])
  end

  # get 'pictures/new' => 'pictures#new'
  def new
    @picture = Picture.new
  end

  # post 'pictures' => 'pictures#create'
  def create

    # make a new picture with what picture_params returns (which is a method we're calling)
    @picture = Picture.new(picture_params)
    # for form_tag
    # @picture = Picture.new(
    #   :url params[:url],
    #   :title params[:title]
    #   :artist params[:artist]
    # )

    if @picture.save
      # if the save for the picture was successful, go to index.html.erb
      redirect_to pictures_url
    else
      # otherwise render the view associated with the action :new (i.e. new.html.erb)
      render :new
    end

    # render text: "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
  end

  #  get 'pictures/:id/edit' => "pictures#edit"
  def edit
    @picture = Picture.find(params[:id])
  end

  #  patch 'pictures/:id' => "pictures#update"
  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      #redirect_to "/pictures/#{@picture.id}"
      redirect_to picture_path(@picture)
    else
      render :edit
    end
  end

  # Delete 'pictures/:id' => 'pictures#destroy'
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

  # Strogn Params
  private
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end

end
