require "gosu"

class Space
  attr_reader :x, :y
  def initialize(window)
    @image = Gosu::Image.new(window, "./img/galaxy.jpg", true)
    @y = @x = @z = 0
    @offset = 60
  end

  def move all_objects

    player = all_objects.find_master

    unless player.nil?
      @x -= player.velx
      @y -= player.vely
    end


    all_objects.each do |obj|
      obj.x_rel = obj.x + @x 
      obj.y_rel = obj.y + @y
    end
  end

  def draw
    @image.draw @x, @y, 0
  end
end
