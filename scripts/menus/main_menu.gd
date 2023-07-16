extends Control

@export var button_hover_audio := AudioStream
@export var GameScene := PackedScene
@export var Options := PackedScene
@export var Credits := PackedScene

@onready var audio_player := get_node("sfx")
@onready var start := get_node("Buttons/Start")
@onready var options := get_node("Buttons/Options")
@onready var credits := get_node("Buttons/Credits")
@onready var exit := get_node("Buttons/Exit")


func _ready():
	print("main menu")
	$AnimationPlayer.play("MainMenuStart")


func play_audio(stream):
	if not stream: return
	audio_player.set_stream(stream)
	audio_player.play(0.0)


func stop_audio():
	audio_player.stop()


func mouse_entered():
	play_audio(button_hover_audio)

