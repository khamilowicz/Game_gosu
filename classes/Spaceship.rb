require 'json'
require "./classes/spaceobject.rb"
require "./modules/Movable.rb"
require "./modules/Steerable.rb"
require "./classes/spaceSocket.rb"
require "./modules/datable.rb"

class Spaceship < SpaceObject

  include Steerable
  include Movable
  extend Datable::Classable
  include Datable::Instance

  def initialize(window, vel=0.0, x=0.0, y=0.0)
    super(window, "./img/spaceship.png", x, y, vel, 0.0, -90)
    @maxVel = 5.0
  end

  def fire
    Photon.new(@window, @x,@y,@angle)
  end


end
