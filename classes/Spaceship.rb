require 'json'
require "./classes/spaceobject.rb"
require "./modules/Movable.rb"
require "./modules/Steerable.rb"
require "./classes/spaceSocket.rb"
require "./modules/datable.rb"
require "./modules/keyboardable.rb"

class Spaceship < SpaceObject

  include Steerable
  include Movable::Instance
  extend Movable::Classable
  extend Datable::Classable
  include Datable::Instance

  def initialize(window, vel=0.0, x=0.0, y=0.0)
    super(window, "./img/spaceship.png", x, y, vel, 0.0, -90)
    @maxVel = 5.0
    @block = false
  end

  def fire
    Photon.new(@window, @x,@y,@angle)
  end

  def keyboard window

    if window.button_down? Gosu::KbP and not @block_p
      p Photon.all
      @block_p = true
    end

    if window.button_down? Gosu::KbSpace and not @block
      fire 
      @block = true
    end

    turn_left if window.button_down? Gosu::KbLeft or window.button_down? Gosu::GpLeft 
    turn_right if window.button_down? Gosu::KbRight or window.button_down? Gosu::GpRight 
    self.break if window.button_down? Gosu::KbDown or window.button_down? Gosu::GpDown 
    accelerate if window.button_down? Gosu::KbUp or window.button_down? Gosu::GpUp 
  end

  def button_up id
    if id == Gosu::KbSpace
      @block = false
    end
  end
end
