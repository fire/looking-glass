extends ColorRect

# 00
@export_file("*.png") var quilt : String
	
func _ready():	
	var tex : TextureLayered = ResourceLoader.load(quilt)
	var images = []
	const layer_count = 45
	for layer_i in range(layer_count):
		images.push_front(tex.get_layer_data(layer_i))
	
	var tex_final : Texture2DArray = Texture2DArray.new()
	tex_final.create_from_images(images)

	material.set_shader_param("screen", tex)


