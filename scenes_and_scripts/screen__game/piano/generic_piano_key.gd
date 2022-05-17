extends Button

onready var _generic_piano_key_pressed = self.connect("pressed",self,"send_key_signal")

func _ready():
	pass

func send_key_signal():
	Signals.emit_signal("piano_key_input_detected")
