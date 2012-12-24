require "./classes/Spaceship.rb"
require "gosu"

window = Gosu::Window.new(640,480,false)
sp = Spaceship.new(window)
ap = Spaceship.new(window)

p sp
p Spaceship.all
