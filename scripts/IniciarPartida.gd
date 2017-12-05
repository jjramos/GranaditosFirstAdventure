extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var tiempo=30

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	tiempo=tiempo-delta
	
	if(tiempo<0 || Input.is_action_pressed("accion")):
		get_tree().change_scene("res://escenas/Raiz.tscn")
		
	if(tiempo<10):
		get_node("pulsaEspacio").set_hidden(false)
