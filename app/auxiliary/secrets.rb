class Secrets < SimpleDelegator
  include Singleton

  def initialize
    super Hashie::Mash.new(Rails.application.secrets)
  end

  def self.respond_to?(symbol, include_all = false)
    instance.respond_to? symbol, include_all
  end

  def self.method_missing(name, *args, &block)
    instance.send name, *args
  end
end
