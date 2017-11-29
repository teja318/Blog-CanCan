class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  has_many :permissions
  has_many :roles, through: :permissions
  has_many :articles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  after_create :assign_default_role
  
  def role?(role)
  	self.roles.pluck(:name).include? role
  end
  
  def assign_default_role
    self.roles.push(Role.last)
  end 

end
