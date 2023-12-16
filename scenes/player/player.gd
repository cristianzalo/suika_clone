extends CharacterBody2D


const SPEED = 200.0
signal drop
var CanShoot = true
var offset_from_character = Vector2(0, 50)


func _physics_process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
		
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		
	position += velocity * delta* SPEED
	$DropPosition.global_position = global_position + offset_from_character
	
	if Input.is_action_pressed("drop"):
		_drop()
		$AnimatedSprite2D.stop()
	
	move_and_slide()
	#_drop_planet()
	
func _drop():
	if not CanShoot:
		return
	else:
		$AnimatedSprite2D.play("shoot")
		CanShoot = false
		drop.emit()
		$DropTimeout.start()
		
			
		

func _on_drop_timeout_timeout():
	CanShoot= true 
	
