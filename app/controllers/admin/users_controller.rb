class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    password = PasswordGenerator.generate!
    @user.password = password
    @user.password_confirmation = password
    Rails.logger.debug "The password is #{password}"
    if @user.save
      flash[:success] = 'User Created successfully'
      redirect_to admin_users_path
    else
      flash[:error] = 'Please check the data and try again'
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :phone_number, :email, :city, :admin)
    end
end
