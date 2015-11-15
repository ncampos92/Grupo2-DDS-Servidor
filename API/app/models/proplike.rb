class Proplike < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal

  validates :user, uniqueness: true, presence: true
  validates :proposal, presence: true
end
