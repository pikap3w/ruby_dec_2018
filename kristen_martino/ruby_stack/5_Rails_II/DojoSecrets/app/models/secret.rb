class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :likes
  has_many :likes, dependent: :destroy
  has_many :users_liked_by, through: :likes, source: :user
  validates :content, presence: true
end
