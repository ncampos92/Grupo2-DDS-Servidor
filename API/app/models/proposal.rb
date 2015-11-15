class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :proplikes

  validates :user, :titulo, :texto, presence: true
  validates :user_id, :uniqueness => { :scope => :titulo }
end
