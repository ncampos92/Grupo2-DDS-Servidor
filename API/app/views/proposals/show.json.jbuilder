#json.extract! @proposal, :id, :texto, :user_id, :created_at, :updated_at
json.texto @proposal.texto
json.id @proposal.id
json.titulo @proposal.titulo
json.autor @dueno
json.likes @proposal.upvotes
json.dislikes @proposal.downvotes
json.user_likes @proposal.user_likes(current_user_api)
json.user_dislikes @proposal.user_dislikes(current_user_api)
json.comments @proposal.get_comments_by_date.each do |comment|
		json.comment do
			json.texto comment.texto
			json.created comment.created_at
			json.author_first User.find_by(id: comment.user_id).first_name
			json.author_last User.find_by(id: comment.user_id).last_name
			json.author_id comment.user_id
			json.comment_id comment.id
			json.likes comment.upvotes
			json.dislikes comment.downvotes
			json.user_likes comment.user_likes(current_user_api)
			json.user_dislikes comment.user_dislikes(current_user_api)
		end
end
