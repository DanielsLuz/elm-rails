module ElmViewHelper

  def elm_embed(module_name, elm_object_id)
    content_tag(:div) do
      component_div(elm_object_id) + script_tag(module_name, elm_object_id)
    end
  end

  private

  def component_div(elm_object_id)
    content_tag(:div, "", id: elm_object_id)
  end

  def script_tag(module_name, elm_object_id)
    content_tag(:script, type: "text/javascript") do
      render(file: "elm/mount_script.js.erb", 
             locals: { module_name: module_name,
                       elm_object_id: elm_object_id })
    end
  end

end
