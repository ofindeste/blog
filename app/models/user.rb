class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:default, :admin]

  def set_as_default
    self.role = :default
  end

  def set_as_admin 
    self.role = :admin
  end
end
