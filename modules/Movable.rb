require "gosu"

module Movable

  @angle = @x = @y = @vel = @angle = 0

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
    p "w move with block"
    p @x, @y, @angle, @vel

    @x += Gosu::offset_x(@angle, @vel)
    @y += Gosu::offset_y(@angle, @vel)

    yield @x, @y, @angle, @vel if block_given?

  end
end
