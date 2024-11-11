# frozen_string_literal: true

class Coffee
  attr_reader :beans, :name

  TYPES = {
    espresso:   'Espresso',
    long_black: 'Long Black',
    cappuccino: 'Cappuccino',
    latte:      'Latte'
  }.freeze

  BEANS = {
    arabica: 'Bourbon',
    robusta: 'Kouilou'
  }.freeze

  NON_EXISTENT_DRINK = 'Shmurdyak'

  def self.call(params, barista=false)
    new(params, barista).call
  end

  def initialize(params, barista=false)
    @sugar   = params[:sugar]
    @beans   = BEANS[params[:beans]]
    @name    = TYPES[params[:name]]
    @barista = barista
  end

  def call
    grind_beans
    validate_coffee_name
    prepare_coffee_drink
    add_sugar

    check_software_updates

    tell_bye
    self
  end

  def with_sugar?
    sugar == true
  end

  def grind_beans
    puts "=== Grinding #{beans} beans ... ==="
  end

  def validate_coffee_name
    return unless TYPES[name].nil?

    self.name = NON_EXISTENT_DRINK
  end

  def add_sugar
    puts '=== Adding sugar ===' if with_sugar?
  end

  def prepare_coffee_drink
    puts "=== Prepare #{name} ... ==="
  end

  def check_software_updates
    return unless time_for_update

    puts '=== Checking updates ... ==='
    timeout
  end

  def tell_bye
    puts '=== Take your coffee, please! Have a good day! ==='
    puts '=== B Y E ==='
  end

  private

  attr_accessor :sugar, :barista
  attr_writer :beans, :name

  def time_for_update
    true
  end

  def timeout
    unless barista
      puts 'Updates only for BARISTA!!!'
      return
    end

    # NEVER DO THIS IS REAL LIVE!
    # Here can be call of some external services
    sleep(5000)
    puts '=== Updates were loaded... ==='
  end
end
