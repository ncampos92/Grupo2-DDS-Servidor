#json.extract! @proposal, :id, :texto, :user_id, :created_at, :updated_at
json.texto @proposal.texto
json.autor @dueno
json.comments do
	json.array! @proposal.comments
end
