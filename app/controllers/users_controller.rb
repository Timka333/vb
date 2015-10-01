class UsersController < ApplicationController
  def index
  end

  def control
  	if user_signed_in?
  	else
  	  redirect_to root_path
  	end
  	@project = Project.new
  	@all_users_projects = Project.all
    @current_users_projects = Project.where( :user_id => current_user.id )

  end

  def create
  	@project = Project.new(project_params)
 
	@project.save
	redirect_to '/users/control'
  end
	 
private
	def project_params
	  params.require(:project).permit(:title, :descrip, :user_id)
	end
end
