#json.extract! @proposal, :id, :texto, :user_id, :created_at, :updated_at
json.texto @proposal.texto
json.autor @dueno
json.comments do
	@proposal.comments.each do |comment|
		json.comment do
			json.text comment.texto
			json.created comment.created_at
			json.author_first comment.user.first_name
			json.author_last commment.user.last_name
			json.comment_id comment.id
		end
	end
end
