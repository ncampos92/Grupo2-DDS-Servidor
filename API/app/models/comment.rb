class Comment < ActiveRecord::Base

  has_many :likes
  belongs_to :user
  belongs_to :proposal

  validates :user, :proposal, :texto, :approved, presence: true
end
