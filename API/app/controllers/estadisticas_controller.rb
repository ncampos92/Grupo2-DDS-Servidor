class EstadisticasController < ApplicationController
  before_action :restrict_access
  before_action :set_proposals



  def show
  end

  private
    def set_proposals
      @proposals = Proposal.all.sort {|a,b| b.score <=> a.score}
    end
end
