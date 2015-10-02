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

  def edit_project
    @project = Project.find(params[:id])
    @todolist = Todolist.new
    @current_users_todolists = Todolist.where( :user_id => current_user.id )
  end

  def create_todolist
    @todolist = Todolist.new(todolist_params)
 
    proj_id = params[:todolist][:project_id]
    @todolist.save
    redirect_to :action => 'edit_project', :id => proj_id
    #logger.debug 'Project id params :'  {params[:todolist].inspect}
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
  ## SoF Todo Params
  def todolist_params
    params.require(:todolist).permit(:title, :user_id)
  end
end
