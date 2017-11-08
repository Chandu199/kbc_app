class Admin::UsersController < AdminController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
    @users = @users.decorate
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    new_password = set_password(@user)
    user.password = new_password
    user.password_confirmation = new_password

    if @user.save
      PasswordMailer.user_login(@user, password)
      flash[:success] = 'User Created successfully'
      redirect_to admin_users_path
    else
      flash[:error] = 'Please check the data and try again'
      render :new
    end
  end

  def edit

  end

  def update
    new_password = set_password(@user)
    user.password = new_password
    user.password_confirmation = new_password

    if @user.update_attributes(user_params)
      PasswordMailer.user_login(@user, password)
      flash[:success] = 'User details Updated Successfully'
      redirect_to admin_users_path
    else
      flash[:danger] = 'User details Not updated'
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :phone_number, :email, :city, :admin)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def set_password(user)
      PasswordGenerator.generate!
    end
end
