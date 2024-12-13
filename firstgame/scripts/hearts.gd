extends HBoxContainer

var panel = load("res://scenes/panel.tscn")


func _ready() -> void:
	for i in range(5):
		var heart = panel.instantiate()
		add_child(heart)


func _on_player_player_hit() -> void:
	get_child(0).queue_free()
