require "../hw-2-oop/item"

class Music < Item
  CATEGORY = :music
  attr_reader :singer, :duration

  def initialize(options = {})
    super(options.merge(category: CATEGORY))
    @singer = options[:singer]
    @duration = options[:duration]
  end
  def category
    CATEGORY
  end
  def play
    puts 'Music is playing'
  end
end
