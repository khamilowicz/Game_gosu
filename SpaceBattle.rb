require 'gosu'
require "texplay"
require "./Spaceship.rb"
require "./Photon.rb"
require "./space.rb"
require "./spaceSocket.rb"

class SpaceBattle < Gosu::Window
  def initialize()
    super 640, 480, false
    self.caption = "Gosu tutorial game"

    @player = Spaceship.new(self)
    @player_2 = Spaceship.new(self,40,80)
    @space = Space.new(self)
    @block = false
    start_socket
  end

  def update

    if button_down? Gosu::KbSpace and not @block
      @player.fire 
      @block = true
    end

    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.turn_left 
    end

    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.turn_right 
    end

    if button_down? Gosu::KbDown or button_down? Gosu::GpDown then
      @player.break 
    end

    if button_down? Gosu::KbUp or button_down? Gosu::GpUp then
      @player.accelerate 
    end

		@player.move
    @space.move @player, Spaceship
    Photon.move
		multiplayer
		@player_2.move
  end

	def multiplayer

    send_data @player.data
    @player_2.data = get_data
		
	end

  def draw
    @player.draw
    @player_2.draw
    @space.draw
    Photon.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

  def button_up(id)
    if id == Gosu::KbSpace
      @block = false
    end
  end
end

