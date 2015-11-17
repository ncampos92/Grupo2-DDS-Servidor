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
end
