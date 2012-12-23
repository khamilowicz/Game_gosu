require "socket"

s = TCPSocket.new 'localhost', 8000

while line = s.gets
				puts line 
end

s.close
