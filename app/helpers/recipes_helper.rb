module RecipesHelper
  def add_direction_link(name, form)
    link_to_function name do |page|
      direction = render(:partial => "direction", :locals => { :form => form, :direction => RecipeDirection.new })
      page << %{
        var new_direction_id = "new_" + new Date().getTime();
        $('#directions').append( "#{ escape_javascript direction }".replace(/new_\\d+/g, new_direction_id) );
      }
    end
  end
end
