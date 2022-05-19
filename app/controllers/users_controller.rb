class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)
    @user = User.create(user_params)

    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])
    session[:user_id] = user.id

      redirect_to root_path, notice: 'Вы успешно зарегистрировались'
    end
end
