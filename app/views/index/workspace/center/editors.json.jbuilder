json.editors_count  @edit_roles.size
json.editors do
	json.array! @edit_roles do |role|
		json.role role.name
		json.editor do
			editor = role.editor
			json.extract! editor, :id, :number
			json.avatar editor.avatar
		end
	end
end
