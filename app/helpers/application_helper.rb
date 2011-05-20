module ApplicationHelper

  def include_javascript( *filenames )
    filenames.each do |filename|
      content_for(:head) do
        javascript_include_tag filename
      end
    end
  end

  def include_stylesheet( *filenames )
    filenames.each do |filename| 
      content_for(:head) do
        stylesheet_link_tag filename
      end
    end
  end
end
