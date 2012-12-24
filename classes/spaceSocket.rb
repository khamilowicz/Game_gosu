require "json"
require "socket"
require "timeout"

def start_socket
  @socket = TCPSocket.new 'localhost', 8000
end


def send_data data
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
