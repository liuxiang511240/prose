#用户
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :face

  validates_presence_of :name, :message => 'name is must!'
  # validates_presence_of :email, :message => 'email is must!'
  # validates_presence_of :password, :message => 'password is must!'
  validates_length_of :name, :maximum => 10, :message => 'Up to 10 characters'
  # validates_format_of :email, :with => /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/, :message => 'email format error!'

  def is_admin?
    ['liuxiang511240@163.com'].include?(self.email)
  end

  def can_edit?(user)
    return false if user.blank?
    user.is_admin?
  end

  def can_delete?(user)
    return false if user.blank?
    user.is_admin?
  end
end
