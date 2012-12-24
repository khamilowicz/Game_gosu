require "socket"

class SpaceServer

    @@clients = []
  def initialize
    @echo = false
  end

  def set_echo_server
    @echo = true
  end

	def set_broadcast_server
					@echo = false
	end

	def echo?
					@echo
	end

  def start

    server = TCPServer.new 8000
    puts "Server is on"

    loop do

      Thread.start(server.accept) do |client|
        @@clients << client
        until @@clients.size > 1 || echo?
        end

        broadcast = echo? ? @@clients : @@clients.reject{|i| i == client}

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
    Thread.kill(@server)
  end

end
