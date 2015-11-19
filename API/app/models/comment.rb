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

  def score
    self.upvotes - self.downvotes
  end

  def user_likes user
    if self.likes.find_by(user_id: user, score: 1)
    	return 'true'
    else
    	return 'false'
    end
  end

  def user_dislikes user
    if self.likes.find_by(user_id: user, score: -1)
    	return 'true'
    else
    	return 'false'
    end
  end

  def interactions
    self.upvotes + self.downvotes
  end
end
