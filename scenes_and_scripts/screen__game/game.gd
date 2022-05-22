extends Control


func _ready():
	SoundGenerator.generate_new_key_sound()
	var _err1 = Signals.connect("piano_key_input_detected",self,"on_key_pressed")

func on_key_pressed(_note, _octave):
	print(_note, _octave)
	#SoundGenerator.generate_random_key_sound()
