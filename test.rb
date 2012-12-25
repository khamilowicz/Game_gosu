require "gosu"
require "./classes/Spaceship.rb"
require "./classes/Photon.rb"
require "./server.rb"
require "./classes/DataPacker"

server = SpaceServer.new
server_thread = Thread.new{server.start}

  sleep(0.1)
  window = Gosu::Window.new(640,480,false)
  Photon.set_default_window window
  sp = Spaceship.new(window)
  sp.status = 'master'
  sp_2 = Spaceship.new(window)
  sp_2.fire
  sp_2.fire

	photon_1 = Photon.all.first
	photon_2 = Photon.all.last

	p Photon.all

	p photon_1
	p photon_2

	p "After deletion"

	photon_1.delete

	p Photon.all


  Thread.kill(server_thread)
