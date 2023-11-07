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

  
end
