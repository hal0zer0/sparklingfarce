extends Node2D
# Battle Manager will hold a lot of logic.  I'm currently thinking
# that it should even be what handles the controls, as opposed to a "Player"
# type object which seems natural at first.

# That way when in World (non combat) mode, we can just use a different Manager
# which has all the controls for that mode.  So switch manager scripts instead
# of a bunch of if/thens in a single script.  

# It may contain the Turn Manager as well, not sure.  

@onready var tyler = $"../Tyler"

@export var battle_name = "Default"

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Battle Manager Starting")
	print("Battle name: " + battle_name)
	tyler.init()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
