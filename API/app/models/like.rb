class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  validates :user, :comment, :score, presence: true
  validates :user_id, :uniqueness => { :scope => :comment_id }
  validates :score, inclusion: {in: [-1,1]}
end
