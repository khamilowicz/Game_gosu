module Steerable

  def turn_right
    @angle += 4.5
  end

  def turn_left
    @angle -= 4.5
  end

  def accelerate
    @vel += 0.5 if @vel < @maxVel
  end

  def break
    @vel -= 0.5 if @vel >= 0.5
  end
end
