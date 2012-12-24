require "gosu"

class SpaceObject

  @@id_counter = 0

  @@container = {}

  attr_accessor :x, :y, :z, :id, :vel, :angle

  def initialize(window, image_path, x, y, vel =0.0, angle=0.0, d_angle =0.0, z=1)
    @window = window
    @x, @y, @z, @vel, @angle, @d_angle = x, y, z, vel, angle, d_angle
    @image = Gosu::Image.new(window, image_path, true)
    @@id_counter+=1
    @id = @@id_counter
		add_to_container @id, self
  end

	def self.container
    @@container.select{|klass, objects| klass.to_s == self.name}.values.flatten
	end

  def add_to_container id, obj
    if not @@container[obj.class].nil?
      @@container[obj.class] << obj
    else
      @@container[obj.class] = [obj]
    end
  end

  def self.all
    container
  end

  def self.each
    container.each do |obj|
      yield obj
    end
  end

  def draw
    @image.draw_rot @x, @y, @z, @angle + @d_angle
  end

  def self.draw
    container.each do |obj|
      obj.draw
    end
  end

  def delete
    self.class.container.delete self
  end
end