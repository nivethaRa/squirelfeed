class UsersController < ApplicationController

  def index
  end

  def edit
  	@user = Shoppe::User.find(params[:id])
  end

    def update
      @user = Shoppe::User.find(params[:id])
      if @user.update(safe_params)
        redirect_to [:edit, @user], flash: { notice: t('shoppe.users.update_notice') }
      else
        render action: 'edit'
      end
    end

  def profile
  	if (User.find_by_name(params[:id]))
  		@name = params[:id]
  	else
  		redirect_to root_path, :notice=>"User not found!"
  	end
  end

  private

    def safe_params
      params[:user].permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
    end

end
