#json.extract! @proposal, :id, :texto, :user_id, :created_at, :updated_at
json.texto @proposal.texto
json.id @proposal.id
json.titulo @proposal.titulo
json.autor @dueno
json.aprueba @proposal.proplikes.where(score: 1).count
json.desaprueba @proposal.proplikes.where(score: -1).count
json.comments @proposal.comments.each do |comment|
		json.comment do
			json.text comment.texto
			json.created comment.created_at
			json.author_first User.find_by(id: comment.user_id).first_name
			json.author_last User.find_by(id: comment.user_id).last_name
			json.author_id comment.user_id
			json.comment_id comment.id
			json.likes comment.likes.where(score: 1).count
			json.dislikes comment.likes.where(score: -1).count
		end
end
