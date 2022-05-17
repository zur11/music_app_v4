extends Control

func _ready():
	Signals.connect("piano_key_input_detected",self,"on_GenericButton_pressed")


func on_GenericButton_pressed():
	print('nota')
