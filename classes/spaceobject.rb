require "gosu"

class SpaceObject

  @@container = []

	attr_accessor :x, :y

  def initialize(window, image_path, x, y, vel =0.0, angle=0.0, d_angle =0.0, z=1)
    @window = window
    @x, @y, @z, @vel, @angle, @d_angle = x, y, z, vel, angle, d_angle
    @image = Gosu::Image.new(window, image_path, true)
    @@container << self 
  end

  def self.add obj 
    @@container << obj
  end

  def self.all
    @@container
  end

  def self.each
    @@container.each do |obj|
      yield obj
    end
  end

  def draw
    @image.draw_rot @x, @y, @z, @angle + @d_angle
  end

	def self.draw
					@@container.each do |obj|
						obj.draw
					end
	end

	def delete
					@@container.delete self
	end
end
