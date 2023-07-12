extends Camera3D

var torque = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ahhhhhhhhhhh")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	torque += delta
	self.rotate_y(torque)
	
