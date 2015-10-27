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
    @add_user = User.new
    @todolistitem = Todolistitem.new
    @current_users_todolists = Todolist.where( :user_id => current_user.id, :proj_id => @project.id )
    @current_users_todolistitems = Todolistitem.where( :user_id => current_user.id )
  end

  def complete
    @complete = Todolistitem.find(params[:todolistitem][:todolistsitem_id])
    @complete.update_attributes(todolistitem_complete_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def add_user
    @add_user = Usertobe.new(usertobe_params)
    @add_user.save
    UsertobeMailer.invite_email(@add_user)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create_todolist_item
    @todolistitem = Todolistitem.new(todolistitem_params)

    proj_id = params[:todolistitem][:proj_id]
    @todolistitem.save
    redirect_to :action => 'edit_project', :id => proj_id
  end

  def create_todolist
    @todolist = Todolist.new(todolist_params)
 
    proj_id = params[:todolist][:proj_id]
    @todolist.save
    redirect_to :action => 'edit_project', :id => proj_id
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
    params.require(:todolist).permit(:title, :user_id, :proj_id)
  end
  ## SoF Todolistitems Params
  def todolistitem_params
    params.require(:todolistitem).permit(:title, :user_id, :todolists_id)
  end
  ## SoF Todolistitems Params CHECKBOX
  def todolistitem_complete_params
    params.require(:todolistitem).permit(:finished)
  end

  def usertobe_params
    params.require(:user).permit(:email)
  end

end
