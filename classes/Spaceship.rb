require 'json'
require "./classes/spaceobject.rb"
require "./modules/Movable.rb"
require "./modules/Steerable.rb"
require "./classes/spaceSocket.rb"

class Spaceship < SpaceObject

  include Steerable
  include Movable

  attr_accessor :angle, :vel, :x, :y

  def initialize(window, vel=0.0, x=0.0, y=0.0)
    super(window, "./img/spaceship.png", x, y, vel, 0.0, -90)
		@maxVel = 5.0
  end

  def fire
    Photon.new(@window, @x,@y,@angle)
  end

  def data
    {'vel' => vel, 'angle' => angle}.to_json
  end

  def data= s_data

    resc = false
    begin
      m_data = JSON.load(s_data)
    rescue
      resc = true
    end

    unless resc
      @vel = m_data['vel']
      @angle = m_data['angle']
    end
  end
end

