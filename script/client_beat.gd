extends Node


func _input(event: InputEvent) -> void:
	if event.is_pressed():
		var car = PacketPeerUDP.new()
		car.set_dest_address('127.0.0.1',1998)
		car.put_packet('PUSHED'.to_ascii())


func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	if response_code == 200:
		print_debug()
