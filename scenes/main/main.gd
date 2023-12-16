extends Node2D


#signal CanShoot
@export var planet : PackedScene




# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func drop_planet_main():
	var InsPlanet = planet.instantiate()
	InsPlanet.position = $Player.get_node("DropPosition").global_position
	add_child(InsPlanet)
	
	

