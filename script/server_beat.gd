extends SceneTree

func _init() -> void:
	print_debug()
	var car = PacketPeerUDP.new()
	car.listen(1998,'127.0.0.1')
	if car.is_listening():
		print('listening OK')
	else:
		print('listening Fail')
	
	if car.get_available_packet_count() > 0:
		var data = car.get_packet().get_string_from_ascii()
		print_debug()
		print(data)
	
	
