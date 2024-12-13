extends Node3D

@onready var hit_rect = $UI/ColorRect
@onready var spawns = $spawns
#@onready var player = $WORLD/NavigationRegion3D/player
@onready var navigation_region = $NavigationRegion3D
var enemy = load("res://scenes/enemy.tscn")
var instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cheat"):
		Global.update_score(1)


func _get_random_child(parent_node):
	var random_id = randi() % parent_node.get_child_count()
	return parent_node.get_child(random_id)

func _on_spawn_timer_timeout() -> void:
	var spawn_point = _get_random_child(spawns).global_position
	instance = enemy.instantiate()
	instance.position = spawn_point
	navigation_region.add_child(instance)


func _on_player_player_hit() -> void:
	Global.player_health -= 1
	hit_rect.visible = true
	await get_tree().create_timer(.2).timeout
	hit_rect.visible = false 
	if Global.player_health <=0:
		Global.score = 0
		get_tree().change_scene_to_file("res://scenes/game.tscn")
