class UserController < ApplicationController
  def index
    render({ :template => "user_templates/list"})
  end

  def show
    the_id = params.fetch("path_id")
    matching_records = User.where ({ :id => the_id })
    @the_user = matching_records.at(0)
    render({ :template => "user_templates/details"})
  end

end
