extends Node

var score = 0
var player_health = 5
signal hard
signal harder
signal update


func update_score(num):
	score += num
	emit_signal("update")
	if (score == 5):
		emit_signal("hard")
	if (score == 15):
		emit_signal("harder")
