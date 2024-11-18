extends Spatial

var sm64_handler = preload("res://mods/Fish64/SM64Handler.tres")

var mariomode = false

func _ready() -> void:
	pass



func _input(ev):
	if Input.is_key_pressed(KEY_M) && !mariomode:
		mariomode = true
		var next_level_resource = load("res://mods/Fish64/sm64obj.tscn")
		var next_level = next_level_resource.instance()
		add_child(next_level)
		next_level.transform.origin = get_node("/root/world/Viewport/main/map/main_map/spawn_position").transform.origin
		sm64_handler.rom_filename = "" # Set your ROM path here -- we need to do this dynamically too 
		sm64_handler.global_init()
		get_node("/root/Fish64/SM64Objects/StaticSurfacesHandler").load_static_sufaces()
		get_node("/root/Fish64/SM64Objects/SurfaceObjectsHandler").load_all_surface_objects()
		for mario in get_tree().get_nodes_in_group("Mario"):
			mario.camera = get_node("/root/world/shader_ignore/Viewport/Camera")
			mario.create()
