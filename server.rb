require "socket"

def start_server

  server = TCPServer.new 8000
  puts "Server is on"
  @@clients = []

  loop do

    Thread.start(server.accept) do |client|
      @@clients << client
      while @@clients.size < 2
      end

      broadcast = @@clients.reject{|i| i == client}

      while line = client.gets
        broadcast.each do |res_client|
          res_client.puts line
        end
      end	
      client.close
      puts "client close"
    end
  end
end

def stop_server
end

start_server

