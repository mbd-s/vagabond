class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    #this method is called when the user logs in, it looks up the user's record
    #in †he db and validates that the password matches
    user_params = params.require(:user).permit(:email, :password)
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

end
