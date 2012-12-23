module NavHelper

	def active_link(controller, action)
		'class="active"' if params[:action] ==  action
	end

end
