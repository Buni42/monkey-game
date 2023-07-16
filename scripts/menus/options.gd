extends Control

@onready var fullscreen_button = get_node("TabContainer/OPTIONS/window/fullscreen/CheckBox")
@onready var resizable_button = get_node("TabContainer/OPTIONS/window/resizeable/CheckBox")
@onready var borderless_button = get_node("TabContainer/OPTIONS/window/borderless/CheckBox")
@onready var vsync_button = get_node("TabContainer/OPTIONS/video/vsync/CheckBox")
@onready var show_fps_button = get_node("TabContainer/OPTIONS/video/ShowFps/CheckBox")
@onready var mute_button = get_node("TabContainer/OPTIONS/sound/mute/CheckBox")


func _ready() -> void:
	if GAME.fullscreen:
		fullscreen_button.set_deferred("pressed", true)
	else:
		fullscreen_button.set_deferred("pressed", false)

	if GAME.resizable:
		resizable_button.set_deferred("pressed", true)
	else:
		resizable_button.set_deferred("pressed", false)

	if GAME.borderless:
		borderless_button.set_deferred("pressed", true)
	else:
		borderless_button.set_deferred("pressed", false)

	if GAME.vsync:
		vsync_button.set_deferred("pressed", true)
	else:
		vsync_button.set_deferred("pressed", false)

	if GAME.show_fps:
		show_fps_button.set_deferred("pressed", true)
	else:
		show_fps_button.set_deferred("pressed", false)
		
	if GAME.mute:
		mute_button.set_deferred("pressed", true)
	else:
		mute_button.set_deferred("pressed", false)



func _on_vsync_toggled(button_pressed):
	GAME.vsync = button_pressed
	if button_pressed:
		print("vsync on")
		OS.set_deferred("vsync_enabled", true)
	else:
		print("vsync off")
		OS.set_deferred("vsync_enabled", false)



func _on_FPS_toggled(button_pressed):
	GAME.show_fps = button_pressed



func _on_mute_toggled(button_pressed):
	GAME.mute = button_pressed
	if button_pressed:
		get_tree().current_scene.get_node("music").set_deferred("stream_paused", true)
	else:
		get_tree().current_scene.get_node("music").set_deferred("stream_paused", false)



func _on_fullscreen_toggled(button_pressed):
	GAME.fullscreen = button_pressed
	if button_pressed:
		print("fullcreen")
		OS.set_deferred("window_mode", "fullscreen")
	else:
		print("not fullscreen")
		OS.set_deferred("window_fullscreen", false)



func _on_resizeable_toggled(button_pressed):
	GAME.resizable = button_pressed
	if button_pressed:
		print("resizable")
		OS.set_deferred("window_resizable", true)
	else:
		print("not resizable")
		OS.set_deferred("window_resizable", false)



func _on_borderless_toggled(button_pressed):
	GAME.borderless = button_pressed
	if button_pressed:
		print("borderless")
		OS.set_deferred("window_borderless", true)
	else:
		print("not borderless")
		OS.set_deferred("window_borderless", false)



func _on_h_slider_value_changed(value):
	GAME.master_val = value
	print(GAME.master_val)
