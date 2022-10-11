extends KinematicBody2D
var velocidade = Vector2.ZERO
export (PackedScene) var Projetil

func _physics_process(delta):
	velocidade.x = Input.get_action_strength("direita2") - Input.get_action_strength("esquerda2")
	velocidade.y = Input.get_action_strength("baixo2") - Input.get_action_strength("cima2")
	move_and_slide(velocidade*500)
	trocaSprite(velocidade)
	if Input.is_action_just_pressed("tiro2"):
		shoot()
	pass

func shoot():
	var canhaoB = Projetil.instance()
	owner.add_child(canhaoB)
	canhaoB.transform = $"canhao2".global_transform

func trocaSprite(vel):
	if(vel.x == 1):
		$".".rotation_degrees = 90
	if(vel.x == -1):
		$".".rotation_degrees = 270
	if(vel.y == 1):
		$".".rotation_degrees = 180
	if(vel.y == -1):
		$".".rotation_degrees = 0
		
	if(vel.y == -1 and vel.x == -1):
		$".".rotation_degrees = 270+45
	if(vel.y == -1 and vel.x == 1):
		$".".rotation_degrees = 45
	if(vel.y == 1 and vel.x == 1):
		$".".rotation_degrees = 180-45
	if(vel.y == 1 and vel.x == -1):
		$".".rotation_degrees = 180+45
	pass


func _ready():
	pass

