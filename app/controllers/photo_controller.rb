class PhotoController < ApplicationController
  def index
    render({ :template => "photo_templates/list"})
  end

  def show
    the_id = params.fetch("path_id")
    matching_records = Photo.where ({ :id => the_id })
    @the_photo = matching_records.at(0)

    render({ :template => "photo_templates/details"})
  end

  def insert
    @new_photo = Photo.new
    @new_photo.image = params.fetch("input_image")
    @new_photo.caption = params.fetch("input_caption")
    @new_photo.owner_id = params.fetch("input_owner_id")

    if @new_photo.valid?
      @new_photo.save
      redirect_to("/photos/#{@new_photo.id}", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos", { :notice => "Photo failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_photo = Photo.where({ :id => the_id }).at(0)

    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")

    if @the_photo.valid?
      @the_photo.save
      redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo updated successfully."} )
    else
      redirect_to("/photos/#{@the_photo.id}", { :alert => "Photo failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_photo = Photo.where({ :id => the_id }).at(0)

    @the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end

  def comment

    @new_comment = Comment.new
    @new_comment.photo_id = params.fetch("input_photo_id")
    @new_comment.body = params.fetch("input_comment")
    @new_comment.author_id = params.fetch("input_author_id")

    @new_comment.save

    the_id = params.fetch("input_photo_id")

    redirect_to("/photos/#{the_id}", { :notice => "Commented successfully."} )
  end
end
