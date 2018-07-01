extends KinematicBody2D

onready var sprite = get_node("sprite")
var screensize
var lookingForward = true
var animation = "idle"
var GROUND_LEVEL = 50
var isFlying = false
const speed = 100

func _ready():
    screensize = get_viewport_rect().size
    position = Vector2(10, screensize.y-GROUND_LEVEL)

func _process(delta):
    var direction = Vector2(0,0)
    if ( Input.is_action_pressed("ui_up") ):
        direction += Vector2(0,-1)
    if ( Input.is_action_pressed("ui_down") ):
        direction += Vector2(0,1)
    if ( Input.is_action_pressed("ui_left") ):
        lookingForward=false
        direction += Vector2(-1,0)
    if ( Input.is_action_pressed("ui_right") ):
        lookingForward=true       
        direction += Vector2(1,0)
        
    if direction.length() > 0:
        move_and_collide( direction * speed * delta)
        position.y = clamp(position.y, 0, screensize.y)
        animation = "walk"
    
    if position.y < screensize.y-GROUND_LEVEL:
        animation = "fly"

    if Input.is_action_pressed("eat"):
        animation = "eat"
        
    if Input.is_action_pressed("eat_floor"):
        animation = "eat_floor"
   
    sprite.flip_h = lookingForward
    sprite.play(animation)

func _on_sprite_animation_finished():
    animation = "idle"   

func _on_Area2D_body_entered(body):
    print("Collision")

func _on_Player_body_entered(body):
    if body.position.x < position.x:
        print("object at left")
    else:
        print("object at right")