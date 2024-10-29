class Item
  attr_reader :name, :code, :category, :size

  def initialize(options = {})
    @name = options[:name]
    @code = options[:code]
    @category = options[:category]
    @size = options[:size]
  end

  def category
    raise NotImplementedError, 'For subclasses only!'
  end
end
