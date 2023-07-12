extends Node3D

@onready var music_player := get_node("music")
@export var main_theme := AudioStream

# Called when the node enters the scene tree for the first time.
func _ready():
	get_random_music()
	play_audio(main_theme)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
