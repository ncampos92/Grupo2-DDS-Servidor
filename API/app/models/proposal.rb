class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :proplikes

  validates :user, :titulo, :texto, presence: true
  validates :user_id, :uniqueness => { :scope => :titulo }

  def upvotes
    self.proplikes.where(score: 1).count
  end

  def downvotes
    self.proplikes.where(score: -1).count
  end

  def score
    self.upvotes - self.downvotes
  end

  def user_likes user
    if self.proplikes.find_by(user_id: user, score: 1)
    	return 'true'
    else
    	return 'false'
    end
  end

  def user_dislikes user
    if self.proplikes.find_by(user_id: user, score: -1)
    	return 'true'
    else
    	return 'false'
    end
  end

  def get_comments_by_date
    self.comments.sort {|a,b| a.created_at <=> b.created_at}
  end

  def interactions
    self.upvotes + self.downvotes
  end

  def apoyo
    if self.interactions != 0
      apoyo = Float(self.upvotes)/self.interactions*100;
      return apoyo.round(2);
    else
      return 0;
    end
  end
end
