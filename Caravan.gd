extends Area2D
onready var sprite = get_node("sprite")
signal stopCaravan
var emitted = false

func _process(delta):
    if emitted == false:
        if position.x < 150:
            position.x += 0.5
            sprite.play("walk")  
        else:
            emitted = true
            emit_signal("stopCaravan")
            sprite.play("idle")  
        