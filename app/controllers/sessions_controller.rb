class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
      render :new
    end
  end

  def create
    #confrim is an instance method of user (in the user model)
    @user = User.confirm(user_params)
    if @user
      login(@user) # <-- login the user
      redirect_to @user # <-- go to show
    else
      redirect_to login_path
    end
  end

  def destroy
    logout # this method lives in the SessionsHelper!
    redirect_to root_path
  end

  private

  def user_params
    #this method is called when the user logs in, it looks up the user's record
    #in †he db and validates that the password matches
    params.require(:user).permit(:email, :password)
  end

end
