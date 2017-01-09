class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :init

  has_many :privatewikis, dependent: :destroy

  def init
    self.role ||= :member
  end

  enum role: [:member, :premium, :admin]
end
