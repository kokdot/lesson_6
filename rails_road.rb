require_relative('station')
require_relative('route')
# require_relative('train')
# require_relative('van')
require_relative('cargo_train')
require_relative('passenger_train')
require_relative('passenger_van')
require_relative('cargo_van')
require_relative('main')


class RailsRoad
  attr_accessor :stations, :trains, :routes
  attr_reader :main 
  def initialize
    @stations = {}
    @trains = {}
    @routes = {}
    @main = Main.new(self.stations, self.trains, self.routes)
  end


  def seed
    st1 = Station.new('Station1')
    @stations[st1.name.to_sym] = st1
    st2 = Station.new('Station2')
    @stations[st2.name.to_sym] = st2
    st3 = Station.new('Station3')
    @stations[st3.name.to_sym] = st3
    st4 = Station.new('Station4')
    @stations[st4.name.to_sym] = st4

    st11 = Station.new('Station11')
    @stations[st11.name.to_sym] = st11
    st12 = Station.new('Station12')
    @stations[st12.name.to_sym] = st12
    st13 = Station.new('Station13')
    @stations[st13.name.to_sym] = st13
    st14 = Station.new('Station14')
    @stations[st14.name.to_sym] = st14

    rt1 = Route.new(st1, st4)
    rt1.add_station = st2
    rt1.add_station = st3
    @routes["#{rt1.first.name}_#{rt1.last.name}"] = rt1


    rt11 = Route.new(st11, st14)
    rt11.add_station = st12
    rt11.add_station = st13
    @routes["#{rt11.first.name}_#{rt11.last.name}"] = rt11

    train1 = PassengerTrain.new(10586)
    @trains[train1.number] = train1
    train2 = CargoTrain.new(10685)
    @trains[train2.number] = train2
  end
end