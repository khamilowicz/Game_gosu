require "json"
require "socket"
require "timeout"

@socket_on = false
def socket_on?
  @socket_on
end

def start_socket
  @socket = TCPSocket.new 'localhost', 8000
  @socket_on = true
	p 'Socket started'
end


def send_data data
  start_socket unless socket_on?
  @socket.puts data
end

def get_data
  data = ''
  begin
    Timeout::timeout(0.01){
      while line = @socket.gets
        data = line
      end
    }
  rescue Timeout::Error
  end

  data
end
