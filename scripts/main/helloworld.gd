extends Node2D

var text = str("hello this is our first 3D game in godot")
var mousepos
var fullscreen = false
var resizable = false
var borderless = false
var vsync = false
var show_fps = false
var mute = false
var master_val = 0


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	mousepos = get_local_mouse_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	print(text)

