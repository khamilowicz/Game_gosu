require './SpaceBattle.rb'
require "./server.rb"

server = SpaceServer.new
server.set_broadcast_server
server_thread = Thread.new{server.start}
window = SpaceBattle.new
window.show
