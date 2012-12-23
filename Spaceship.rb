require "gosu"
require 'json'
require './modules'

class Spaceship

  include Steerable
  include Movable


  @@spaceships = []
  attr_accessor :angle, :vel, :x, :y
  def initialize(window, x=0, y=0)
    @window = window
    @x = @y = 100.0
    @angle = @vel = 0.0
    @d_angle = -90.0
    @image = Gosu::Image.new(window, "./img/spaceship.png", true)
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


  def fire
    Photon.new(@window, @x,@y,@angle)
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

