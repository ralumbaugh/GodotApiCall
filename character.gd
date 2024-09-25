class_name Character

extends Node
signal has_died
signal has_loaded

@export var character : String
@export var health: int

var chest := Equipment.new()
var legs := Equipment.new()

func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$HTTPRequest.request("https://swapi.dev/api/people/" + str(randi_range(1, 82)))

class Equipment:
	var armor := 10
	var weight := 5
	
func die():
	health = 0
	print(character + " died.")
	emit_signal("has_died", character)
	queue_free()
	
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	character = json["name"]
	emit_signal("has_loaded")

func mourn(character_name):
	print(character + ": Oh no! " + character_name + " is no more!")
	print("*" + character + " begins sobbing*")
