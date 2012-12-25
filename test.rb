require "gosu"
require "./classes/Spaceship.rb"
require "./classes/Photon.rb"
require "./server.rb"
require "./classes/DataPacker"

server = SpaceServer.new
server_thread = Thread.new{server.start}
server.set_echo_server

sleep(0.1)
window = Gosu::Window.new(640,480,false)
DefaultWindow = window
sp = Spaceship.new(window)
sp.status = 'master'
sp.fire
sp_2 = Spaceship.new(window)
sp_2.fire
sp_2.fire

sp.accelerate

10.times{
				sp.move
}

datapacker = DataPacker.new
datapacker.add_data Spaceship
datapacker.add_data Photon

send_data datapacker.flush_data_to_json

begin
  datapacker.unpack_data get_data
end until datapacker.available?

data = datapacker.flush_data

Spaceship.read_data_for_all data
Photon.read_data_for_all data
p Spaceship.all
Thread.kill(server_thread)
