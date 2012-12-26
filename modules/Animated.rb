module Animated
				
				def draw
								@animated ||= Gosu::Image.load_tiles(@window, @image, 64,64,true)
								@i ||= 0
								@image = @animated[@i]
								super
								@i += 1
								@i = nil if @i == @animated.size
				end
	
end
