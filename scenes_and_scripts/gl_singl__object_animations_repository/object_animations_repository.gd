extends Node

const TRANSPARENT_COLOR  = Color("00000000")

onready var anim_tween : Tween = Tween.new()
onready var btn_scale_anim:Vector2 = Vector2(1.2,1.2)
onready var btn_anim_time:float = 0.3


func _ready() -> void:
	add_child(anim_tween)

func scale_btn_size(btn:TextureButton, duration:float = btn_anim_time):
	var _scaleBtn = anim_tween.interpolate_property(btn, 
										"rect_scale", btn.get_scale(),
										Vector2(1,1), duration, Tween.TRANS_QUAD, Tween.EASE_OUT)
	var _tweenStart = anim_tween.start()
	yield(anim_tween, "tween_completed")

func fade_in(obj:Node, duration:float, startColor:Color, endColor:Color = TRANSPARENT_COLOR) -> void:
	var _fadeIn = anim_tween.interpolate_property(obj, 
										"color", endColor,
										startColor, duration)
	var _fadeInStart = anim_tween.start()
	yield(anim_tween, "tween_completed")

func fade_out(obj:Node, duration:float, startColor:Color, endColor:Color = TRANSPARENT_COLOR) -> void:
	var _fadeOut = anim_tween.interpolate_property(obj, 
										"color", startColor,
										endColor, duration)
	var _fadeOutStart = anim_tween.start()
	yield(anim_tween, "tween_completed")
