extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var tiempo=60
export var puntos=0
export var necesario=110

var etiquetaTiempo
var etiquetaPuntos


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	etiquetaTiempo=get_node("Tiempo")
	etiquetaPuntos=get_node("Puntos")
	var oro=get_node("Oro")
	oro.connect("sumarPuntos", self, "sumarPuntos")
	
	set_process(true)

func _process(delta):
	tiempo=tiempo-delta
	
	if(Input.is_action_pressed("escape")):
		get_tree().quit()
	
	if(tiempo<=0):
		mostrarFinal()
	else:
		actualizarTiempo(tiempo)
	
func actualizarTiempo(tiempo):
	etiquetaTiempo.set_text("Tiempo: %02d" % tiempo)

func actualizarPuntos(puntos_):
	etiquetaPuntos.set_text("Puntuación: %02d" % puntos_)

func sumarPuntos(puntos_):
	puntos=puntos+puntos_
	actualizarPuntos(puntos)
	
func mostrarFinal():
	get_node("final").show()
	var texto=get_node("final/textoFinal")
	
	if(puntos>necesario+necesario*0.2):
		texto.set_text("Ouch! Al intentar salir del laberinto, el suelo se abre debajo de ti, por el exceso de peso del dinero que no necesitas... Qué pena")		
	else:
		if(puntos<necesario-necesario*0.2):
			texto.set_text("Vaya! No conseguiste suficiente dinero para ayudar a tu familia. Acabaste en una ensalada...")		
		else:		
			texto.set_text("Magnífico! Cumpliste tu objetivo, y porás vivir con tu familia tranquilamente")	
			
			
			