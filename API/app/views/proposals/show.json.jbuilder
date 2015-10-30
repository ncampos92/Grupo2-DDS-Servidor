#json.extract! @proposal, :id, :texto, :user_id, :created_at, :updated_at
json.texto @proposal.texto
json.id @proposal.id
json.autor @dueno
json.comments @proposal.comments.each do |comment|
		json.comment do
			json.text comment.texto
			json.created comment.created_at
			json.author_first User.find_by(id: comment.User_id).first_name
			json.author_last User.find_by(id: comment.User_id).last_name
			json.author_id comment.User_id
			json.comment_id comment.id
		end
end
