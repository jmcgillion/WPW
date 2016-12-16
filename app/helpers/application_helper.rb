module ApplicationHelper
  def respond_format
  	respond_to do |format|
  	  format.js
  	end
  end
  def nested_notes(notes)
    notes.map do |note, sub_notes|
      render(note) + content_tag(:div, nested_notes(sub_notes), :class => "nested_notes")
    end.join.html_safe
  end
  def nested_categories(categories)
    categories.map do |category, sub_categories|
      render(category) + content_tag(:div, nested_categories(sub_categories), :class => "nested_categories")
    end.join.html_safe
  end
end
