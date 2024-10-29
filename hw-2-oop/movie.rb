require "../hw-2-oop/item"

class Movie < Item
  CATEGORY = :movie
  attr_reader :director, :main_actress, :main_actor

  def initialize(options = {})
    super(options.merge(category: CATEGORY)) #виклик конструктора батьківського класу (Item)
    @director = options[:director]
    @main_actor = options[:main_actor]
    @main_actress = options[:main_actress]
  end
  def category
    CATEGORY
  end
  def play
    puts 'Moving is playing'
  end
end
