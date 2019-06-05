class Wagon
  require_relative '../brand'
  attr_reader :type
  include Brand

  def initialize(type)
    @type = type
  end

  def info
    [type, brand].join(" - ")
  end
end
