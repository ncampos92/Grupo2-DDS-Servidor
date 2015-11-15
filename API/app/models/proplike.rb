class Proplike < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal

  validates :user, :proposal, :score, presence: true
  validates :user_id, :uniqueness => { :scope => :proposal_id }
  validates :score, inclusion: {in: [-1,1]}
end
