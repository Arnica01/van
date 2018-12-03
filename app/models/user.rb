class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  before_validation :assign_role
  def assign_role
    self.role = Role.find_by_name("Member") if self.role.nil?
  end

end
