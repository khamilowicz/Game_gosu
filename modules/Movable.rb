require "gosu"

module Movable

  module Instance
    def velx
      Gosu::offset_x(@angle, @vel)
    end

    def vely
      Gosu::offset_y(@angle, @vel)
    end

    def move 
      move_with_block
    end

    def move_to x,y,angle
      @x,@y,@angle = x, y, angle
    end

    def move_with_block

      @x += velx 
      @y += vely 
      @x_rel += velx
      @y_rel += vely

      yield @x, @y, @angle, @vel if block_given?
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
