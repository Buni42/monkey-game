extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label3D.text = GAME.text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
