# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def tree_select(categories, model, name, class_name, selected=0, level=0, init=true)
    html = ""
    # The "Root" option is added
    # so the user can choose a parent_id of 0
    # TODO: HACK
    # NOTE: CASE # 334 I HAVE REMOVED THE PARENT ID FROM THE LIST AS IT WAS GIVEN A PAGE CRASH..
    # NEED TO SEE WHAT EXTACLTY THE ISSUE IS..
    if init
        # Add "Root" to the options
        html << "<select name=\"#{model}[#{name}]\" id=\"#{model}_#{name}\" class='#{class_name}'>\n"
        html << "\t<option value=\"0\""
        html << " selected=\"selected\"" if selected == 0
        html << ">Root</option>\n"
    end
    if categories.length > 0
      level += 1 # keep position
      categories.collect do |cat|
#        unless cat.product_status_id.eql?(3) || cat.id.eql?(selected.id)
        unless cat.id.eql?(selected.id)
            html << "\t<option value=\"#{cat.id}\" style=\"padding-left:#{level * 10}px\""
            html << ' selected="selected"' if cat.id == selected.parent_id
            add = ""
            level.times do
              add += "-" unless level.eql?(1)
            end
            html << ">#{add} #{cat.title}</option>\n"
            html << tree_select(cat.children, model, name, nil, selected, level, false) unless cat.children.blank?

        end
      end
    end

    html << "</select>\n" if init
    return html
  end
end
