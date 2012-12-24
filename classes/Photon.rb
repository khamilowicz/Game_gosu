require "./classes/spaceobject.rb"
require "./modules/Movable.rb"
require "./modules/data.rb"

class Photon < SpaceObject

  include Movable
	extend Datable::Classable
	include Datable::Instance
	

  def initialize(window, x,y,angle)
    super(window, "./img/photon.png", x,y, 8.0, angle)
  end

  def move
    move_with_block do |x,y|
      unless x.between?(0.0, 640.0) && y.between?(0.0, 480.0)
        delete
      end
    end
  end

  def self.move 
    self.each do |photon|
						p photon
      photon.move
    end
  end
end
