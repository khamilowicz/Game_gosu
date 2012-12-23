require "gosu"
require 'json'

class Spaceship


  @@spaceships = []
  attr_accessor :angle, :vel, :x, :y
  def initialize(window, x=0, y=0)
    @window = window
    @x = @y = 100.0
    @angle = @vel = 0.0
    @d_angle = -90.0
    @image = Gosu::Image.new(window, "./spaceship.png", true)
    #@image.rect 0,0, 200,100, color: :white, fill: true, dest_select: :transparent
    @@spaceships << self

  end

  def self.each

    @@spaceships.each do |spaceship|
      yield spaceship
    end
  end

	def self.spaceships
					@@spaceships
	end

  def velx
    Gosu::offset_x(@angle, @vel)
  end

  def vely
    Gosu::offset_y(@angle, @vel)
  end

  def fire
    Photon.new(@window, @x,@y, @angle)
  end

  def turn_right
    @angle += 4.5
  end

  def turn_left
    @angle -= 4.5
  end

  def accelerate
    @vel += 0.5 if @vel < 5
  end

  def break
    @vel -= 0.5 if @vel >= 0.5
  end

  def move
    @x += Gosu::offset_x(@angle, @vel)
    @y += Gosu::offset_y(@angle, @vel)
    #@x %= 640
    #@y %= 480
  end

  def draw
    @image.draw_rot @x, @y, 1, @angle + @d_angle
  end

  def data
    {'vel' => vel, 'angle' => angle}.to_json
  end

  def data= s_data

    resc = false
    begin
      m_data = JSON.load(s_data)
    rescue
      resc = true
    end

    unless resc
      @vel = m_data['vel']
      @angle = m_data['angle']
    end
  end
end

