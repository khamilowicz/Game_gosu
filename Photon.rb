require 'gosu'

class Photon

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

  def initialize(window, x,y,angle)
    @x = x
    @y = y
    @angle = angle
    @vel = 10.0
    @d_angle = -90.0
    @image = Gosu::Image.new(window, "./photon.png", true)
    @@photons << self

  end

  def move
    @x += Gosu::offset_x(@angle, @vel)
    @y += Gosu::offset_y(@angle, @vel)

    unless @x.between?(0.0, 640.0) && @y.between?(0.0, 480.0)
      delete
    end
  end

  def delete
    @@photons.delete self
  end
end

