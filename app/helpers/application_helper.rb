module ApplicationHelper

  def page_title
    t "#{controller.class.name.gsub(/::.+/, '').downcase}.title"
  end

end
