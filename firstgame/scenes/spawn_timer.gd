extends Timer

func _ready():
	Global.connect("update", _rate_change)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _rate_change():
	print(self.wait_time)
	self.wait_time=1+(5/exp(.05 * Global.score))
