require 'gosu'
require "texplay"
require "./classes"
require "./classes/DataPacker.rb"

class SpaceBattle < Gosu::Window
  def initialize(name = '')
    super 640, 480, false
    self.caption = "Gosu tutorial game"
    @name = name

    @player = Spaceship.new(self,0,320,240)
    @player.status = 'master'

    @player_2 = Spaceship.new(self,0,320,240)

    @space = Space.new(self)
    Photon.set_default_window self
    @datapacker = DataPacker.new

    @block = false
    #@block_p = false
    @time_mem = 0.0
    start_socket
  end

  def update

    unless @pause
      @player.keyboard self

      multiplayer
      @player.move
      @player_2.move
      Photon.move
      @space.move Spaceship
      @space.move Photon
    end

  end

  def multiplayer

    @datapacker.add_data @player
    @datapacker.add_data Photon

    send_data @datapacker.flush_data_to_json
		@all_data = get_data 
    @datapacker.unpack_data(@all_data)

    @all_data = @datapacker.flush_data

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
    @player.button_up id
  end
end
