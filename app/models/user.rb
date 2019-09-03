class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :user_digests, dependent: :destroy
  after_initialize :set_as_default, :receive_digest_weekly, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:default, :admin]

  enum digest: [:daily, :weekly, :refuse]

  def set_as_default
    self.role = :default
  end

  def set_as_admin 
    self.role = :admin
  end

  def receive_digest_daily
    self.digest = :daily
  end

  def receive_digest_weekly
    self.digest = :weekly
  end

  def receive_digest_refuse
    self.digest = :refuse
  end
end
