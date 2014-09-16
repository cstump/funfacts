module ApplicationHelper

  def region_name
    controller.region.name
  end

  def region_t(ypath, args = {})
    t "#{region_name}.#{ypath}", args
  end

  def region_path(name, args = {})
    send "#{name}_path", args.merge(region: region_name)
  end

  def source_links_for(fact)
    sets = fact.datasets.map do |set|
      link_to set.name.underscore.humanize, set.uri, target: '_blank'
    end

    I18n.t('sources', source_links: sets.join(', ')).html_safe
  end

end
