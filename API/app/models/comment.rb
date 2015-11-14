class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal

  validates :user, :proposal, presence: true
end
