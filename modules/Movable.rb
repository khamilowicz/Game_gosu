require "gosu"

module Movable

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
    @x += Gosu::offset_x(@angle, @vel)
    @y += Gosu::offset_y(@angle, @vel)

    yield @x, @y, @angle, @vel if block_given?

  end
end
