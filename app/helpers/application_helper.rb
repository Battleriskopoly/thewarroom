module ApplicationHelper

	def link_to_add_fields(name, f, association, id, assignedClass)
	  new_object = f.object.class.reflect_on_association(association).klass.new
	  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
		render(association.to_s.singularize + "_fields", :f => builder)
	  end
	if assignedClass != -1
	  button_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", class: assignedClass, id: id)
	else
	  button_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", class: "newObjectButton", id: id)
	end
	end
  def broadcast(channel, data)
    client = Faye::Client.new(request.domain + '/faye')
    client.publish('/' + channel, 'text' => data)

   
  end
  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
end
