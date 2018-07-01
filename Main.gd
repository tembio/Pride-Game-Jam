extends Node

export (PackedScene) var Player
var touchingSeed = false

func _ready():
    $Music.play()
    $Player.hide()
    $Water/sprite.play("default")

func _process(delta):
    if $Player.animation == "eat_floor" and touchingSeed:
       $Seed.hide()

func _on_Seed_seedCollisionEnter():
    touchingSeed = true

func _on_Seed_seedCollisionExit():
    touchingSeed = false


func _on_Caravan_stopCaravan():
    print(123123)
    $Player.position = $Caravan.position
    $Player.position.x += 15    
    $Player.show()
    
