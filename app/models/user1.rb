class User1 < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :set_default_role
  belongs_to :user_role, optional: true

  private


  def set_default_role
    self.update(user_role_id: UserRole.find_by(role: 2).id)
  end
end
