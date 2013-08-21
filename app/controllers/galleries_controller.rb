class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = Gallery.new(params[:gallery])

    if @gallery.save
      redirect_to @gallery, notice: 'Gallery was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @gallery = Gallery.find(params[:id])

    if @gallery.update_attributes(params[:gallery])
      redirect_to @gallery, notice: 'Gallery was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Successfully deleted gallery"
    redirect_to galleries_url
  end
end
