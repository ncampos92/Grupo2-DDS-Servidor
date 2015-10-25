class Comment < ActiveRecord::Base
  belongs_to :User
  belongs_to :Proposal
end
