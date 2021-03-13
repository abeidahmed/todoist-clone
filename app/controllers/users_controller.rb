class UsersController < ApplicationController
  layout "slate"

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        sign_in(@user)
        format.html { redirect_to root_path }
      else
        format.turbo_stream
        format.html { render :new }
        format.json { render json: { errors: @user.errors }, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email_address, :password)
  end
end
