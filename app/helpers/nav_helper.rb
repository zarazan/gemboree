module NavHelper

	def active_link(controller, action)
		'class="active"' if current_page?(:controller => controller, :action => action)
	end

end
