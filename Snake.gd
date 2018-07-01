extends Area2D

onready var sprite = get_node("sprite")

func _ready():
    pass

func _process(delta):
    position.x += -0.5 
    sprite.play("default")