class UserController < ApplicationController
  def index
    render({ :template => "user_templates/list"})
  end

  def show
    the_id = params.fetch("path_id")
    matching_records = User.where ({ :username => the_id })
    @the_user = matching_records.at(0)
    
    render({ :template => "user_templates/details"})
  end

  def insert
    @new_user = User.new
    @new_user.username = params.fetch("input_username")
    @name = @new_user.username

    if @new_user.valid?
      @new_user.save
      redirect_to("/users/#{@name}", { :notice => "User created successfully." })
    else
      redirect_to("/users", { :notice => "User failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_user = User.where({ :username => the_id }).at(0)

    @the_user.username = params.fetch("input_username")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User updated successfully."} )
    else
      redirect_to("/users/#{@the_user.username}", { :alert => "User failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_user = User.where({ :username => the_id }).at(0)

    @the_user.destroy

    redirect_to("/users", { :notice => "User deleted successfully."} )
  end
end
