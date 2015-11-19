class EstadisticasController < ApplicationController
  before_action :restrict_access
  before_action :set_proposals



  def show
  end

  private
    def set_proposals
      @top_proposals = Proposal.all.sort { |a, b| b.interactions <=> a.interactions }.first(5)
      @most_liked_proposals = Proposal.all.sort {|a,b| b.upvotes <=> a.upvotes}.first(5)
      @most_disliked_proposals = Proposal.all.sort {|a,b| b.downvotes <=> a.downvotes}.first(5)
    end
end
