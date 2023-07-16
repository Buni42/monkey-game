extends Node

@onready var music_player := get_node("music")
@export var main_theme := AudioStream
var start_scene
var options_scene
var credits_scene
var main_menu_scene
var next_scene
var next_scene_name
var previous_scene


func _ready():
	get_random_music()
	play_audio(main_theme)
	load_menu()


func load_menu():
	get_node("MainMenu").start.connect("pressed", on_start_pressed)
	get_node("MainMenu").options.connect("pressed", on_options_pressed)
	get_node("MainMenu").credits.connect("pressed", on_credits_pressed)
	get_node("MainMenu").exit.connect("pressed", on_exit_pressed)


@warning_ignore("unused_parameter")
func _process(delta):
	$music.volume_db = GAME.master_val

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().current_scene.get_node("current_scene") != null:
			get_tree().current_scene.get_node("Transition").fade_in()
			print("delete scene and return to main menu")
			next_scene = load("res://scenes/menus/main_menu.tscn").instantiate()
			next_scene_name = "MainMenu"
		if get_tree().current_scene.get_child(2).name == "MainMenu":
			get_tree().current_scene.get_node("Transition").fade_in()
			print("we are in mainmenu, delete main menu")
			next_scene_name = "End Game"



func on_start_pressed():
	$Transition.fade_in()
	start_scene = load("res://scenes/main/game_scene.tscn").instantiate()
	start_scene.name = "current_scene"
	next_scene = start_scene
	next_scene_name = "current_scene"

func on_options_pressed():
	$Transition.fade_in()
	options_scene = load("res://scenes/menus/options.tscn").instantiate()
	options_scene.name = "current_scene"
	next_scene = options_scene
	next_scene_name = "current_scene"

func on_credits_pressed():
	$Transition.fade_in()
	credits_scene = load("res://scenes/menus/credits.tscn").instantiate()
	credits_scene.name = "current_scene"
	next_scene = credits_scene
	next_scene_name = "current_scene"

func on_exit_pressed():
	get_tree().current_scene.get_node("Transition").fade_in()
	next_scene_name = "End Game"

func _on_transition_fade_finished():
	if next_scene_name != "MainMenu":
		get_node("MainMenu").queue_free()
		add_child(next_scene)
		$Transition.fade_out()
	if next_scene_name == "MainMenu":
		add_child(next_scene)
		$Transition.fade_out()
		load_menu()


func _on_transition_fade_started():
	if next_scene_name == "MainMenu":
		get_tree().current_scene.get_node("current_scene").queue_free()
	if next_scene_name == "End Game":
		get_tree().quit()

func play_audio(stream):
	if not stream: return
	music_player.set_stream(stream)
	music_player.play(0.0)


func stop_audio():
	music_player.stop()


func get_random_music():
	# vind een andere manier, dit is vrij slecht
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_index = rng.randi_range(0,2)
	print(random_index)
#	var stream_name = "music" + str(random_index)
#	var stream = load("res://assets/Audio/Music/MenuMusic/"+stream_name+".mp3")
#	play_audio(stream)



