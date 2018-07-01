extends Node

export (PackedScene) var Player
var touchingSeed = false

func _ready():
    $Music.play()

func _process(delta):
    if $Player.animation == "eat_floor" and touchingSeed:
       $Seed.hide()

func _on_Seed_seedCollisionEnter():
    touchingSeed = true

func _on_Seed_seedCollisionExit():
    touchingSeed = false
