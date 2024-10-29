class Catalog
  attr_reader :items_list

  def initialize
    @items_list = []
  end

  def add(item)
    @items_list << item
  end

  def remove(code)
    @items_list.delete_if { |item| item.code == code }
  end

  def show(code)
    item = @items_list.find { |item| item.code == code }
    return unless item

    puts "Name: '#{item.name}'"
    puts "Code: #{item.code}"
    puts "Category: #{item.category}"
    puts "Size: #{item.size} Kb"
    if item.is_a?(Music)
      puts "Singer: '#{item.singer}'"
      puts "Duration: #{item.duration} sec"
    elsif item.is_a?(Movie)
      puts "Director: '#{item.director}'"
      puts "Main Actor: '#{item.main_actor}'"
      puts "Main Actress: '#{item.main_actress}'"
    end
  end

  def list
    @items.each do |item|
      puts "Name: '#{item.name}'"
      puts "Code: #{item.code}"
      puts "Category: #{item.category}"
      puts "Size: #{item.size} Kb"
      if item.is_a?(Music)
        puts "Singer: '#{item.singer}'"
        puts "Duration: #{item.duration} sec"
      elsif item.is_a?(Movie)
        puts "Director: '#{item.director}'"
        puts "Main Actor: '#{item.main_actor}'"
        puts "Main Actress: '#{item.main_actress}'"
      end
      puts '---------------------------------------------'
    end
  end

  private

  def find_item_by(code)
    @items_list.find { |item| item.code == code }
  end
end
