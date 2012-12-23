require "gosu"

class Space
  def initialize(window)
    @image = Gosu::Image.new(window, "./img/galaxy.jpg", true)
    @y = @x = @z = 0
    @offset = 60
  end

  def move player, all_players

    unless player.x.between?(@offset,640 - @offset)
      @x -= player.velx
			player.x -= player.velx
      all_players.each do |playa|
        playa.x -= player.velx
      end

    end

    unless player.y.between?(@offset,480 - @offset)
      @y -= player.vely
			player.y -= player.vely
      all_players.each do |playa|
        playa.y -= player.vely
      end
    end
  end

  def draw
    @image.draw @x, @y, 0
  end
end
