require 'gosu'
require "texplay"
require "./classes"
require "./classes/DataPacker.rb"

class SpaceBattle < Gosu::Window
  def initialize()
    super 640, 480, false
    self.caption = "Gosu tutorial game"

    @player = Spaceship.new(self,0,320,240)
		@player.status = 'master'

    @player_2 = Spaceship.new(self,0,320,240)

    @space = Space.new(self)
		Photon.set_default_window self
    @datapacker = DataPacker.new

    @block = false
    @time_mem = 0.0
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

    if button_down? Gosu::KbP then
						p @player
						p @player_2
						p @all_data
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpUp then
      @player.accelerate 
    end

		multiplayer
		@player.move
		@player_2.move
    Photon.move
		@space.move Spaceship
		
  end

  def multiplayer

    @datapacker.add_data @player
    @datapacker.add_data Photon

    send_data @datapacker.flush_data_to_json
    @datapacker.unpack_data(get_data)

    @all_data = @datapacker.flush_data
		 

		#@player_2.data = all_data['Spaceship'].first unless all_data['Spaceship'].nil?
		Photon.read_data_for_all @all_data
		Spaceship.read_data_for_all @all_data

  end

  def draw

    if (Time.now.to_f - @time_mem) > 0.01
      @player.draw
      @player_2.draw
      @space.draw
      Photon.draw
      @time_mem = Time.now.to_f
    end
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

