extends Control

onready var game_btn_anim : TextureButton = $BtnGame/TextureBtn

var _game_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__game"])

func _ready():
	var _err1 = $BtnGame/Button.connect("pressed",self,"go_to_scene",[_game_scene])

	pass
func go_to_scene(scene):
	AnimatedSceneManager.change_scene_with_animation(scene, game_btn_anim)
