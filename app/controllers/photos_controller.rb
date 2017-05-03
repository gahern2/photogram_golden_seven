class PhotosController < ApplicationController

  def index
    @list_of_all_my_photos = Photo.all
    render("photos/index.html.erb")
  end

  def new_form
    render("photos/new.html.erb")
  end

  def create_row
    url = params[:da_source]
    cap = params[:da_caption]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save
    # render("photos/create_photo.html.erb")
    redirect_to("/photos")
    # redirect_to("/photos/#{new_photo.id}")
  end

  def show
    the_id = params[:id]
    @my_photo = Photo.find(the_id)
    render("photos/show.html.erb")
  end

  def edit_form
    # value = (add this in to get pre filled out URL and caption)
    the_id = params[:id]
    @my_photo = Photo.find(the_id)
    render("photos/edit.html.erb")
  end

  def update_row
    url = params[:da_source]
    cap = params[:da_caption]
    new_photo = Photo.update
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save
    redirect_to("photos/:id")
  end

  def destroy_row
    the_id = params[:id]
    Photo.find(the_id).destroy
    redirect_to("/photos")
  end

end
