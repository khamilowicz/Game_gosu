require "./classes/spaceobject.rb"
require "./modules/Movable.rb"
require "./modules/datable.rb"
require "./modules/collidable.rb"

class Photon < SpaceObject

  include Movable::Instance
  extend Movable::Classable
  extend Datable::Classable
  include Datable::Instance
	include Collidable


  def initialize(window, x=0,y=0,angle=0)
    super(window, "./img/photon.png", x,y, 8.0, angle)
  end

  def move
    super
    unless x.between?(0, 1500.0) && y.between?(0.0, 1500.0)
      delete
    end
  end

  def hit objects
    objects.each do |object|
      if object.x.between?(x-5,x+5) && object.y.between?(y-5,y+5)
        p 'HIT'
        object.hitpoints -= 1
        p "#{object.name} was HIT! Now he has #{object.hitpoints}"
      end
    end
  end

  def self.hit objects
    each do |photon|
      photon.hit objects
    end
  end
end
