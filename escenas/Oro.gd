extends Node2D

export var wCell=64
export var hCell=64

signal sumarPuntos

func _ready():
	set_process(true)

func _on_Area2D_body_enter( body ):
	print("In")
	if(body.get_name()=="Granadito"):
		var pos=Vector2(rand_range(1,15)*wCell,rand_range(2,8)*hCell-16)
		set_pos(pos)
		emit_signal("sumarPuntos",10)
		
	else:
		print("Ouch")
	
	
	

