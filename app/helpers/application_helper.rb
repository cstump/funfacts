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

end
