class PhotosController < ApplicationController
  def new
    @location = Location.find(params[:location_id])
    @photo = Photo.new
    @photo.location = @location
    authorize @photo
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.location = Location.find(params[:location_id])
    authorize @photo
    if @photo.save
      redirect_to location_path(@photo.location)
    else
      render :new
    end


  end

  # def delete
  #   @photo = Photo.find(params[:id])
  #   @photo.destroy
  # end

  private

  def set_photos
    @photos = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:picture)
  end
end
