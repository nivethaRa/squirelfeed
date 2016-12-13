class PagesController < ApplicationController

  def product
  end

  def index
  end

  def home
  end

  def profile
  	if (User.find_by_name(params[:id]))
  		@name = params[:id]
  	else
  		redirect_to root_path, :notice=>"User not found!"
  	end
  end

end
