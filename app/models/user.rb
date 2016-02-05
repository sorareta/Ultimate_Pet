class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	

	
	validates :name, presence:true, uniqueness: true
	

	validates :email, presence:true, uniqueness: true
	
	has_many :pets 
  after_create :send_welcome_email

  protected
  def send_welcome_email
    UserMailer.welcome(self).deliver
  end
	

end
