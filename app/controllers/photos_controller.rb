class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :secure_photo, only: [:edit, :update, :destroy]

  def index
    @photo = Photo.all
  end
  def new
    @photo = current_user.photos.build
  end
  def show
    @photo = Photo.find(params[:id])
  end
  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      flash[:success] = "Your photo has been successfully created!"
      redirect_to photos_path
    else
      flash.now[:alert] = "Your new photo couldn't be created!  Please check the form."
      render :new
    end
  end
  def edit
  end
  def update
    @photo.update(photo_params)
    if @photo.valid?
      flash[:success] = "Your photo has been successfully updated!"
      redirect_to(photo_path(@photo))
    else
      flash.now[:alert] = "Update failed!  Please check the form."
      render :edit
    end
  end
  def destroy
    @photo.destroy
    redirect_to photos_path
  end
  private
    def photo_params
      params.require(:photo).permit(:img, :caption)
    end
    def set_photo
     @photo = Photo.find(params[:id])
    end
    def secure_photo
      unless current_user == @photo.user
        redirect_to root_path
      end
    end

end
