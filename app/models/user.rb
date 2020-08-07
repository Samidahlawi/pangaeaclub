class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  validates_presence_of :first_name, :message =>"الأسم الأول مطلوب"
  validates_presence_of :last_name, :message =>"الأسم الأخير مطلوب"
  # validates_presence_of :password, :message =>"رقم المرور مطلوب"
  validates_presence_of :phone, :message =>"رقم الهاتف مطلوب"
  validates_presence_of :country, :message =>"أرجو أختيار الدولة"

  # validates :last_name,:phone,:country, presence: true

  #many_to_many with booking
  has_many :bookings

  #validation
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  # validates :password, presence: true
  # validates :PW_confirmation, presence: true
  validates :country, presence: true

  # def after_confirmation
  #   welcome_mailer
  # end
  
  after_create :welcome_mailer

  def welcome_mailer
    UserMailer.welcome_mailer(self).deliver_now
  end

end
