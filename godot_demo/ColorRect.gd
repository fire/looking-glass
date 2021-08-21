extends Node3D

var viewports = []
var rs = RenderingServer

func _ready():
	var num_cols = 5
	var num_rows = 9
	var total_views = num_cols * num_rows
	for i in total_views:
		var camera = Camera3D.new()
		add_child(camera)
		camera.owner = owner
		camera.current = true
		var viewport = rs.viewport_create();
		rs.viewport_attach_camera(viewport, camera);
		rs.viewport_set_active(viewport, true);
		var tex_width : int = 4096
		var tex_height : int = 4096
		var view_width : float = float(tex_width) / num_cols
		var view_height : float = float(tex_height) / num_rows
		rs.viewport_set_size(viewport, int(view_width), int(view_height))
		rs.viewport_set_update_mode(viewport, rs.VIEWPORT_UPDATE_ALWAYS)
		rs.viewport_set_scenario(viewport, get_world_3d().get_scenario())
		rs.camera_set_environment(camera.get_camera_rid(), get_node("WorldEnvironment").get_environment())
		viewports.push_back(viewport);

func _on_Timer_timeout():
	var texture_array : Texture2DArray = Texture2DArray.new()
	var texture_images : Array = []
	for viewport in viewports:
		var tex : RID = rs.viewport_get_texture(viewport)
		var img : Image = rs.texture_2d_get(tex)
		print(img.get_size())
		texture_images.push_back(img)

	texture_array.create_from_images(texture_images)
	var rect = get_node("TextureRect")
	ResourceSaver.save("res://tex.res", texture_array)
	rect.material.set_shader_param("screen", texture_array)
