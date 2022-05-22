extends Button

export(SoundGenerator.Notes) var note 

export var sound_4th_octave : AudioStream
export var sound_5th_octave : AudioStream

onready var key_player = $AudioStreamPlayer
onready var sounds = [null,null,null, sound_4th_octave, sound_5th_octave]

onready var playing_octave:int = 3

onready var _err1 = self.connect("pressed",self,"on_piano_key_pressed", [note])

func _ready():
	var _err2 = Signals.connect("new_sound_generated",self,"on_new_sound_generated")

func on_new_sound_generated(_note:int, octave:int):
	playing_octave = octave

func play_key():
	key_player.stream = sounds[playing_octave + 2]
	key_player.play()
	

func on_piano_key_pressed(_note):
	play_key()
	Signals.emit_signal("piano_key_input_detected", _note, playing_octave)
