<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController

  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    @<%= plural_table_name %> = <%= controller_class_name.singularize %>.order("#{sort_column} #{sort_direction}").page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: <%= "@#{plural_table_name}" %> }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: <%= "@#{singular_table_name}" %> }
    end
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    respond_to do |format|
      format.html
      format.json { render json: <%= "@#{singular_table_name}" %> }
    end
  end

  def edit
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "params[:#{singular_table_name}]") %>
    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %> }
        format.json { render json: <%= "@#{singular_table_name}" %>, status: :created, location: <%= "@#{singular_table_name}" %> }
      else
        format.html { render action: "new" }
        format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
        format.html { redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %> }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @<%= orm_instance.destroy %>
    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url }
      format.json { head :no_content }
    end
  end
  
private

  def sort_column
    <%= controller_class_name.singularize %>.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
<% end -%>
