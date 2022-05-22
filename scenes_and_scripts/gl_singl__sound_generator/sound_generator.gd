extends Node


enum Notes {C, D, E, F, G, A, B, Db, Eb, Gb, Ab, Bb}
enum Octaves {oct_4, oct_5}
# enum Octave {oct_0, oct_1, oct_2, oct_3, oct_4, oct_5, oct_6, oct_7, oct_8}

var _notes_elements = Notes.keys().size()
var _octaves_elements = Octaves.keys().size()

func _ready():
	randomize()


func generate_new_key_sound():
	var random_note = randi() % _notes_elements + 1
	var random_octave = randi() % _octaves_elements + 1
	
	Signals.emit_signal("new_sound_generated", random_note, random_octave)
