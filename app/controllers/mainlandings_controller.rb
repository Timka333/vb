class MainlandingsController < ApplicationController
  def index
  	if user_signed_in?
  	  redirect_to '/users/control'
  	else
  	end
  end

  def control
  	if user_signed_in?
  	else
  	  redirect_to root_path
  	end
  end

end
