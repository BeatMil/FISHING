extends Node


func _ready():
	# Create an HTTP request node and connect its completion signal.
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed", self, "_http_request_completed")

	# Perform the HTTP request. The URL below returns a PNG image as of writing.
	var error = http_request.request("https://cdn.discordapp.com/attachments/431477581942882314/696979178993614889/nekopara_cho_va.jpg")
	if error != OK:
		push_error("An error occurred in the HTTP request.")


# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	var image = Image.new()
#	var error = image.load_png_from_buffer(body)
	var error = image.load_jpg_from_buffer(body)
	if error != OK:
		push_error("Couldn't load the image.")

	var texture = ImageTexture.new()
	texture.create_from_image(image)

	# Display the image in a TextureRect node.
	var texture_rect = TextureRect.new()
	add_child(texture_rect)
	texture_rect.texture = texture

