class UsersController < ApplicationController
  def index
    #render json: User.all.map(&:name)
    @user_names = User.all.map(&:name)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.create(user_params)
    s = Session.new(user_id: @user.id)
    s.save_with_session_code
    cookies.permanent[:session_code] = s.session_code

    redirect_to @user
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end
end
