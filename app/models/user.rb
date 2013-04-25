class User < ActiveRecord::Base
	before_save :ensure_authentication_token
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable,
        :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def skip_confirmation!
    self.confirmed_at = Time.now
  end

   def email_required?
    false
  end

  protected
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:username)
    where(conditions).where(["lower(username) = :value", { :value => login.downcase }]).first
  end
end
