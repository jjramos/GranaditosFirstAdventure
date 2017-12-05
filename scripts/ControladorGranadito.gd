extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var avatar
var animacion
var mirando_izquierda=true
var andando=false

export var velocidad=10

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	avatar=get_node(".")
	animacion=get_node("KinematicBody/Animacion")
	set_process(true)

func _process(delta):
	var pos=avatar.get_pos()
	andando=false
	
	if(Input.is_action_pressed("izquierda")):			
		mirando_izquierda=true
		pos.x=pos.x-delta*velocidad
		andando=true

	if(Input.is_action_pressed("arriba")):	
		pos.y=pos.y-delta*velocidad
		andando=true

	if(Input.is_action_pressed("abajo")):	
		pos.y=pos.y+delta*velocidad
		andando=true

	if(Input.is_action_pressed("derecha")):
		mirando_izquierda=false
		pos.x=pos.x+delta*velocidad
		andando=true
	
	if(!andando):	
		animacion.set_animation("parada")
	else:
		if(mirando_izquierda):
			animacion.set_flip_h(false)
			animacion.set_animation("andar-izquierda")
		else:
			animacion.set_flip_h(true)		
			animacion.set_animation("andar-derecha")	
		
	avatar.set_pos(pos)
	
