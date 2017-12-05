extends KinematicBody2D

var avatar
var animacion
var mirando_izquierda=true
var andando=false

export var velocidad=10

var pos

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	avatar=get_node(".")
	animacion=get_node("Animacion")
	pos=Vector2()
	set_fixed_process(true)

func _fixed_process(delta):
	
	andando=false
	
	if(Input.is_action_pressed("izquierda")):			
		mirando_izquierda=true
		pos.x=-velocidad
		andando=true

	if(Input.is_action_pressed("arriba")):	
		pos.y=-velocidad
		andando=true

	if(Input.is_action_pressed("abajo")):	
		pos.y=velocidad
		andando=true

	if(Input.is_action_pressed("derecha")):
		
		mirando_izquierda=false
		pos.x=velocidad
		andando=true
	
	if(!andando):	
		animacion.set_animation("parada")
		pos.x=0
		pos.y=0
	else:
		if(mirando_izquierda):
			animacion.set_flip_h(false)
			animacion.set_animation("andar-izquierda")
		else:
			animacion.set_flip_h(true)		
			animacion.set_animation("andar-derecha")	
	
	var movimiento=pos*delta
	move(movimiento)
	
	if (is_colliding()):
		var n = get_collision_normal()
		movimiento = n.slide(movimiento)
		pos = n.slide(pos)
		move(movimiento)
		