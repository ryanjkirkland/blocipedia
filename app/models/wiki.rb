class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :privatewikis, dependent: :destroy
end
