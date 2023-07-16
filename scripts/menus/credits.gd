extends Control

var scroll = 0
@export var scroll_speed = 100

func _process(delta):
	scroll += delta * scroll_speed
	$ScrollContainer.set_deferred("scroll_vertical", scroll)
