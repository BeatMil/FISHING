extends Node


func _ready():
	# Create an HTTP request node and connect its completion signal.
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed", self, "_http_request_completed")

	 # Perform the HTTP request. The URL below returns some JSON as of writing.
	var error = http_request.request("https://httpbin.org/get")
	if error != OK:
		push_error("An error occurred in the HTTP request.")

	# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	var response = parse_json(body.get_string_from_utf8())

	# Will print the user agent string used by the HTTPRequest node (as recognized by httpbin.org).
	print(response.url)
	print(response.headers["User-Agent"])

