require 'rails_helper'

RSpec.describe Proposal, type: :model do
  
  it "should create" do
  	@user = User.new
  	@user.first_name = "Test"
  	@user.last_name = "tester"
  	@user.email = "test@testing.com"
  	@user.password = "passwordtest123"
  	@user.nivel_acceso = "admin"
  	@user.save 
  	@proposal = Proposal.new
  	@proposal.user = @user
  	@proposal.texto = "Esto es un test"
  	@proposal.titulo = "Test"
  	@proposal.save!
  	expect(Proposal.all.count).to eq(1)
  end
end
