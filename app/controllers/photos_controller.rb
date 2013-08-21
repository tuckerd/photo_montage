class PhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @photo = Photo.new(gallery_id: params[:gallery_id])
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(params[:photo])

    if @photo.save
      redirect_to @photo.gallery, notice: 'Photo was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      redirect_to @photo, notice: 'Photo was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo has been removed."
    redirect_to @photo.gallery
  end

end
