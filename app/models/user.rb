#用户
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel
  include Mongoid::SoftDelete
  include Mongoid::CounterCache
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  ## Database authenticatable
  field :email, type: String, default: ''
  field :name, type: String, default: ''
  field :encrypted_password, type: String, default: ''
  
  ## Recoverable
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: DateTime
  
  ## Rememberable
  field :remember_created_at, type: DateTime
  
  ## Trackable
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, type: DateTime
  field :last_sign_in_at, type: DateTime
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String
  
  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable
  
  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
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
