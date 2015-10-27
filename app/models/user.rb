class User < ActiveRecord::Base
  before_save :set_admin

  validates :name, uniqueness: true, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    admin
  end

  private

  def set_admin
    self.admin = User.count == 0
  end
end
