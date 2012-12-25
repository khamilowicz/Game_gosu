require "./classes/spaceobject.rb"
require "./modules/Movable.rb"
require "./modules/datable.rb"

class Photon < SpaceObject

  include Movable::Instance
  extend Movable::Classable
	extend Datable::Classable
	include Datable::Instance
	

  def initialize(window, x=0,y=0,angle=0)
    super(window, "./img/photon.png", x,y, 8.0, angle)
  end

  def move
    move_with_block do |x,y|
      unless x.between?(-1500.0, 1500.0) && y.between?(-1500.0, 1500.0)
        delete
      end
    end
  end
end
