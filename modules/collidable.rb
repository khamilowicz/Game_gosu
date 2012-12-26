require "./modules/Movable.rb"

module Collidable

  include Movable
  def move 
    collide
    super
  end

  def collide
    [Spaceship, Photon].each do |klass|
      klass.each do |obj|
        if obj.x.between?(x-15, x+15) && obj.y.between?(y-15, y+15) && obj != self
          p "Collision at #{Time.now}"
          vecx = velx - obj.velx
          vecy = vely - obj.vely
          velw = (vecx**2 + vecy**2)**0.5
          angl = Math::acos(vecy/velw)*180/Math::PI
          @vel_outer = -velw
          @angle_outer = -angl
        end
      end
    end
  end
end
