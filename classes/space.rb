require "gosu"

class Space
  attr_reader :x, :y
  def initialize(window)
    @image = Gosu::Image.new(window, "./img/galaxy.jpg", true)
    @y = @x = @z = 0
    @offset = 60
  end

  def move all_players
    player = all_players.find_master
    @x -= player.velx
    @y -= player.vely

    all_players.each do |obj|
        obj.x_rel -=  player.velx
        obj.y_rel -=  player.vely
    end
  end

  def draw
    @image.draw @x, @y, 0
  end
end
