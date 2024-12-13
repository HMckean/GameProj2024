extends Node3D

@onready var anim_player = $AnimationPlayer

func _ready():
	Global.connect("hard", _on_hard)

func _on_hard():
	anim_player.speed_scale = 2 
