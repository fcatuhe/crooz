class SignupsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params)

    if @user.save
      @user.create_tender!
      start_new_session_for @user
      redirect_to new_croozer_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def signup_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
