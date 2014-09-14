module ApplicationHelper

  def page_title
    t "#{region}.title"
  end

  def region
    controller.class.name.gsub(/::.+/, '').downcase
  end

end
