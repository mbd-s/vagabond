class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  # validates :password,
  #           confirmation: true,
  #           length: {minimum: 6}
  validates :email,
            presence: true,
            uniqueness: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    #authenticate is a Bcrypt method
    @user.try(:authenticate, params[:password])
  end
end
