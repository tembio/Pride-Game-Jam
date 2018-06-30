extends Area2D

export (int) var speed
onready var sprite = get_node("sprite")
var screensize
var lookingForward = false

func _ready():
    screensize = get_viewport_rect().size
    position = Vector2(30, screensize.y-100)

func _process(delta):
    sprite.flip_h = lookingForward

    var velocity = Vector2() # The player's movement vector.
    
    if Input.is_action_pressed("ui_right"):
        lookingForward = false
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        lookingForward = true        
        velocity.x -= 1
        
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        position += velocity * delta
        position.x = clamp(position.x, 0, screensize.x)
        position.y = clamp(position.y, 0, screensize.y)
        sprite.play("walk")  
    else:
        sprite.play("idle")  
        