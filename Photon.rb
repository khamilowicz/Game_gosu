require 'gosu'

class Photon

  include Movable

  @@photons = []

  def self.move 
    @@photons.each do |photon|
      photon.move
    end
  end

  def self.photons
    @@photons 
  end

  def self.draw
    @@photons.each do |photon|
      photon.draw
    end
  end

  def draw
    @image.draw @x, @y, 3
  end

  def initialize(window, pos_x,pos_y,angle)
    move_to(pos_x, pos_y, angle)
    @d_angle = -90.0
		@vel = 10
    @image = Gosu::Image.new(window, "./img/photon.png", true)
    @@photons << self
  end

  def move

    move_with_block do |x,y|
      unless x.between?(0.0, 640.0) && y.between?(0.0, 480.0)
        delete
      end
    end
  end

  def delete
    @@photons.delete self
  end
end
