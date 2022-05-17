extends CanvasLayer

onready var transition_rect : ColorRect = ColorRect.new()

func _ready() -> void:
	var full_screen : Vector2 = Vector2(720,1280)
	var transparentColor = Color("00000000")

	transition_rect.rect_size = full_screen
	transition_rect.color = transparentColor

	add_child(transition_rect)

func change_scene_with_animation(scene : PackedScene, btn:TextureButton, container:Node = get_node("/root/Main/MainContainer"))-> void:
	var transitionColor = Color("000000")
	
	#btn scaling
	yield(ObjectAnimationsRepository.scale_btn_size(btn), "completed")	
	
	#fade in
	yield(ObjectAnimationsRepository.fade_in(transition_rect, 0.5, transitionColor), "completed")
	
	#change scene
	if container:
		ScreenManager.go_to_scene(scene, container)
	else:
		ScreenManager.go_to_scene(scene)
	
	#fade out
	yield(ObjectAnimationsRepository.fade_out(transition_rect, 0.5, transitionColor), "completed")
