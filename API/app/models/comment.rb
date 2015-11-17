class Comment < ActiveRecord::Base

  has_many :likes
  belongs_to :user
  belongs_to :proposal

  validates :user, :proposal, :texto, presence: true

  def upvotes
    self.likes.where(score: 1).count
  end

  def downvotes
    self.likes.where(score: -1).count
  end

  def user_likes user
    if self.likes.find_by(user_id: user, score: 1)
    	true
    else
    	false
    end
  end

  def user_dislikes user
    if self.likes.find_by(user_id: user, score: -1)
    	true
    else
    	false
    end
  end
end
