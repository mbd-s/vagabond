class User < ActiveRecord::Base
  has_secure_password
  belongs_to :city
  has_many :posts
  # validates :password,
  #           confirmation: true,
  #           length: {minimum: 6}
  validates :email,
            presence: true,
            uniqueness: true

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    #authenticate is a Bcrypt method
    @user.try(:authenticate, params[:password])
  end
end
