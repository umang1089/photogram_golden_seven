class PhotosController < ApplicationController
  def show
    # The params hash looks like this: {"the_id_number"=>"1"}

    id_number = params["the_id_number"]

    p = Photo.find(id_number)

    @the_caption = p.caption
    @the_image_url = p.source
    @created_at = p.created_at

    render("photos/show.html.erb")
  end

  def index
    @all_photos = Photo.order({:created_at => :desc})

    render("photos/index.html.erb")
  end

  def new_form
    render("photos/new.html.erb")
  end

  def create_row
    #The params look like this:
    # {"the_image_url"=> "https:...", "the_caption"=>"google log"}

    p = Photo.new
    p.source = params["image_source"]
    p.caption = params["image_caption"]
    p.save
    redirect_to("/photos")
  end

  def edit_form
    @the_photo_to_be_edited = Photo.find(params[:the_id])
    render("photos/edit_form.html.erb")

  end

  def update_row
    p = Photo.find(params[:the_id])
    p.source = params["the_source"]
    p.caption = params["the_caption"]
    p.save

    redirect_to("/photos")
  end

end
