require 'rails_helper'

RSpec.describe Like, type: :model do
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
  	@comment = Comment.new
  	@comment.user = @user
  	@comment.proposal = @proposal
  	@comment.texto = "texto de prueba"
  	@comment.save!
  	@like = Like.new
  	@like.user = @user
  	@like.comment = @comment
  	@like.score = 1
  	@like.save!
  	expect(Like.all.count).to eq(1)
  end
end
