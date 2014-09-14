module ApplicationHelper

  def page_title
    t "#{region}.title"
  end

  def region
    controller.class.name.gsub(/::.+/, '').downcase
  end

  def source_links_for(fact)
    sets = fact.open_datasets.map do |set|
      link_to set.name.underscore.humanize, set.url, target: '_blank'
    end

    I18n.t('sources', source_links: sets.join(', ')).html_safe
  end

end
