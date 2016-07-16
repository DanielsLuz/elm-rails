module ElmViewHelper

  def elm_embed(module_name, elm_object_name)
    content_tag(:div) do
      component_div + script_tag(module_name, elm_object_name)
    end
  end

  private

  def component_div
    content_tag(:div) {}
  end

  def script_tag(module_name, elm_object_name)
    content_tag(:script, type: "text/javascript") do
      render(file: "elm/mount_script.js.erb", 
             locals: { module_name: module_name,
                       elm_object_name: elm_object_name })
    end
  end

end
