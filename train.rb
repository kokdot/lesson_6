require_relative('manufacturer')

# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные 
# указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или 
# уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не 
# движется. Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но 
# только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
class Train
  include Manufacturer
  attr_accessor :vans, :route
  attr_reader :number, :station
  NUMBER_FORMAT = /^[а-я0-9a-z]{3}-?[а-я0-9a-z]{2}$/i

  @@trains = {}
  def initialize(number)
    @number = number.to_s
    p @number
    validate!
    @vans = []
    @speed = 0
    @station_index = 0
    @@trains[@number] = self
  end

  def validate!
    raise "Не правильный формат названия поезда" if @number !~ NUMBER_FORMAT
  end


  def valid?
    validate!
    true
  rescue
    false
  end

  def self.find(name)
    @@trains[number]
  end

  def speed(delta)
    if @speed + delta < 0 
        @speed = 0
    else
      @speed += delta
    end
  end

  def station
     if @route == nil
      puts "У Вас нет маршрута"
    else
      @route.stations[@station_index]
    end
  end

  def station_before
     if @route == nil
      puts "У Вас нет маршрута"
    else
      if @station_index == 0
        puts "Вы на первой станции маршрута и у Вас нет предыдущей станции!"
      else
        @route.stations[@station_index - 1]
      end
    end
  end 

  def station_next
     if @route == nil
      puts "У Вас нет маршрута"
    else
      if @station_index == @route.stations.length - 1
        puts "Вы на последней станции маршрута и у Вас нет следующей станции!"
      else
        @route.stations[@station_index + 1]
      end
    end
  end  
  
  def move_ahead
    if @route == nil
      puts "Вы не можете начать движение, потому что у Вас нет маршрута"
    else
      if @station_index == @route.stations.size - 1
        puts "Вы не можете двигаться вперед, потому что это последняя станция вашего маршрута"
      else
        @station_index += 1
        puts "Вы переехали на станцию: #{@route.stations[@station_index]}"
      end
    end
  end

  def move_back
    if @route == nil
      puts "Вы не можете начать движение, потому что у Вас нет маршрута"
    else
      if @station_index == 0
        puts "Вы не можете двигаться назад, потому что это первая станция вашего маршрута"
      else
         @station_index -= 1
         puts "Вы переехали на станцию: #{@route.stations[@station_index]}"
      end
    end
  end
end
