require	'gosu'

class SpaceBattle < Gosu::Window
  def initialize()
    super 640, 480, false
    self.caption = "Gosu tutorial game"

    @player = Spaceship.new(self)
    @background_image = Gosu::Image.new(self, "./galaxy.jpg", true)
    @block = false
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
    Photon.move

  end

  def draw
    @player.draw
    @background_image.draw(0,0,0)
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

