extends SceneTree
const DATA = 'learning networking desu!'
const PORT = 4242
func _init():
	var socket = PacketPeerUDP.new()
	
	socket.set_dest_address("127.0.0.1",PORT)
	
	socket.put_packet(DATA.to_ascii())
	print("Exiting application")    
	self.quit()
