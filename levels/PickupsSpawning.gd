extends Node2D

var spawn_number = 50
var PickupsPool = [
preload("res://pickups/BombPickup.tscn"),
preload("res://pickups/DoublePickup.tscn"),
preload("res://pickups/HealthPickup.tscn"),
preload("res://pickups/Mousetrap.tscn")
]

func _ready():
	if(GlobalVars.characterSelected==1):
		PickupsPool.insert(0, preload("res://pickups/BatteryPickup.tscn"))
	
	for x in 50:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		
		var instance = PickupsPool.pick_random().instantiate()
		
		instance.global_position = Vector2(rng.randi_range(-7000, 7000), rng.randi_range(-5998, 5998))
		%PickupsSpawner.add_child(instance)
