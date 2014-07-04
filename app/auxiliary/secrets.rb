class Secrets < SimpleDelegator
  include Singleton

  def initialize
    super Hashie::Mash.new(Rails.application.secrets)
  end
end
