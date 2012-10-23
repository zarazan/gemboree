module NavHelper

	def active_page?(page_name)
		"active" if params[:action] == page_name
	end

end
