class User < ActiveRecord::Base
  has_secure_password
  belongs_to :city
  has_many :posts

  validates :email,
            presence: true,
            uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
  
end
