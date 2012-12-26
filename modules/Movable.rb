require "gosu"

module Movable

				attr_accessor :angle_outer, :vel_outer
  module Instance
    def velx
      Gosu::offset_x(@angle, @vel) +  Gosu::offset_x(@angle_outer, @vel_outer)
    end

    def vely
      Gosu::offset_y(@angle, @vel) +  Gosu::offset_y(@angle_outer, @vel_outer)
    end

    def move_to x,y,angle
      @x,@y,@angle = x, y, angle
    end

    def move
      @x += velx 
      @y += vely 
      @x_rel += velx
      @y_rel += vely
			@vel_outer *= 0.95
    end

  end
  module Classable

    def move 
      each do |obj|
        obj.move
      end
    end
  end
end
