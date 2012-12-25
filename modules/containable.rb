module Containable

	@@conainer = {}
				module Instance
  def add_to_container id, obj
    if not @@container[obj.class].nil?
      @@container[obj.class] << obj
    else
      @@container[obj.class] = [obj]
    end
  end
				end

				module Classable
					
				end
	
end
