require "gosu"

class SpaceObject

  @@id_counter = 0
  @@defautl_window = nil

  @@container = {}

  attr_accessor :x, :y, :z, :id, :vel, :status, :x_rel, :y_rel, :angle

  def initialize(window, image_path, x, y, vel =0.0, angle=0.0, d_angle =0.0, z=1)
    @window = window
    @x, @y, @z, @vel, @angle, @d_angle = x, y, z, vel, angle, d_angle
    @x_rel, @y_rel = @x, @y

    @status ='slave'
    @image = Gosu::Image.new(window, image_path, true)
    @@id_counter+=1
    @id = @@id_counter
    add_to_container @id, self
  end

  def self.set_default_window window
    @@defautl_window = window
  end

  def self.get_default_window 
    @@defautl_window
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

  def self.find_master
    container.select { |obj| obj.status == 'master' }.first
  end


  def master?
    status == 'master'
  end

  def slave?
    status == 'slave'
  end

  def draw 
    @image.draw_rot @x_rel, @y_rel, @z, @angle + @d_angle
  end

  def self.draw
    container.each do |obj|
      obj.draw
    end
  end

  def delete
    self.class.container[id].delete self
  end

  def to_s
    "#{self.class} number #{@id}\n Position: x: \t#{@x},\t y: \t#{@y}\n \t" +
      "vel: \t#{@vel},\t ang: \t#{@ang}\n"
  end

  def self.find_by_id id 
    all.select{|obj| obj.id == id}.first
  end

end
