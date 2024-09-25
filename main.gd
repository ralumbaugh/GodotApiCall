extends Node
#
#@export var character_to_kill: Character
@export var all_characters: Array[Character]
var characters_loaded := 0

func _on_character_has_died(name):
	for character in all_characters:
		character.mourn(name)


func _on_character_has_loaded():
	characters_loaded += 1
	if characters_loaded >= all_characters.size():
		var victim_index = randi_range(0, all_characters.size()-1)
		var victim = all_characters[victim_index]
		
		all_characters.pop_at(victim_index)
		victim.die()
	pass # Replace with function body.
