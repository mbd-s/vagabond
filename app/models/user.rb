class User < ActiveRecord::Base
  has_secure_password
  has_many :posts

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    #authenticate is a Bcrypt method
    @user.try(:authenticate, params[:password])
  end
end
