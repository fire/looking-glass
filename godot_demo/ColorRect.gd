extends ColorRect

# 00
@export_file("*.png") var quilt : String
	
func _ready():	
	var tex : TextureLayered = ResourceLoader.load(quilt)
	material.set_shader_param("screen", tex)


