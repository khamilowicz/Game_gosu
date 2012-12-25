require "gosu"

module Keyboardable

				def button_down? id
								Gosu::Window.button_down? id
				end
end
