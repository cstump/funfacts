class Secrets < SimpleDelegator
  include Singleton

  def initialize
    super Hashie::Mash.new(Rails.application.secrets)
  end

  def self.method_missing(name, *args, &block)
    instance.send name, *args
  end
end
