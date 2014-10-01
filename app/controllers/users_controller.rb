class UsersController < ApplicationController
  def index
    #render json: User.all.map(&:name)
    @user_names = User.all.map(&:name)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    s = Session.new(user_id: @user.id)
    s.save_with_session_code
    cookies.permanent[:session_code] = s.session_code

    redirect_to @user
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end
end
