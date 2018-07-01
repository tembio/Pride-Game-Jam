extends Area2D

signal seedCollisionEnter
signal seedCollisionExit
onready var sprite = get_node("sprite")

func _process(delta):
    sprite.play("default")

func _on_Area2D_body_entered(body):
    emit_signal("seedCollisionEnter")


func _on_Area2D_body_exited(body):
    emit_signal("seedCollisionExit")
