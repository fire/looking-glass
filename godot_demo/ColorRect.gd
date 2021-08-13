extends ColorRect

# 00
@export_file("*.png") var quilt : String
	
func _ready():	
	var tex : TextureLayered = ResourceLoader.load(quilt)
	var images = []
	var layer_count = 45
	var tiles_v = 5
	var tiles_h = 9
	var count = 0
	for j in range(tiles_v, 0, -1):
		for i in range(tiles_h):
			var img = tex.get_layer_data(i + j * tiles_v)
			images.push_back(img)
	var tex_final : Texture2DArray = Texture2DArray.new()
	tex_final.create_from_images(images)
	material.set_shader_param("screen", tex_final)


