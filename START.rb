require './SpaceBattle.rb'
require "./server.rb"

server = SpaceServer.new
server_thread = Thread.new{server.start}
window = SpaceBattle.new
window.show
