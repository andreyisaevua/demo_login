class UsersController < ApplicationController
  def new
    if current_user
      redirect_back_or root_path
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome! You can now create notes!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
