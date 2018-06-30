extends Area2D

export (int) var speed
onready var sprite = get_node("sprite")
var screensize
var lookingForward = true
var animation = "idle"
var GROUND_LEVEL = 100
var isFlying = false


func _ready():
    screensize = get_viewport_rect().size
    position = Vector2(10, screensize.y-GROUND_LEVEL)

func _process(delta):
    var velocity = Vector2() # The player's movement vector.
    
    if Input.is_action_pressed("ui_right"):
        lookingForward = true
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        lookingForward = false        
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
        
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        position += velocity * delta
        position.x = clamp(position.x, 0, screensize.x)
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