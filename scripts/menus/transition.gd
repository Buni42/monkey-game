extends CanvasLayer

signal fade_finished
signal fade_started

@export var center := Vector2(0.5, 0.5) : set = set_center #percentage on screen like UV
@export var percent := float(0.0) : set = set_percent

func _ready()->void:
	$Fill.material.set("tex_size", get_viewport().get_visible_rect().size)
	$Fill.material.set("pos", center)
	$Fill.material.set("percent", percent)

func set_center(pos: Vector2)->void:
	center.x = clamp(pos.x, 0.0, 1.0)
	center.y = clamp(pos.y, 0.0, 1.0)
	$Fill.material.set("pos", center)

func set_percent(pos: float)->void: 
	percent = pos
	$Fill.material.set("percent", center)

func fade_in():
	set_center(center)
	$AnimationPlayer.play("fade_in")
		
func fade_out():
	set_center(center)
	$AnimationPlayer.play("fade_out")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		emit_signal("fade_finished")
#		print("fade finished")


func _on_animation_player_animation_started(anim_name):
	if anim_name == "fade_out":
		emit_signal("fade_started")
#		print("fade started")
