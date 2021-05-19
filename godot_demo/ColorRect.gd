extends ColorRect

# 00
@export_file("*.png") var image_00 : String
@export_file("*.png") var image_01 : String
@export_file("*.png") var image_02 : String
@export_file("*.png") var image_03 : String
@export_file("*.png") var image_04 : String
@export_file("*.png") var image_05 : String
@export_file("*.png") var image_06 : String
@export_file("*.png") var image_07 : String
@export_file("*.png") var image_08 : String
@export_file("*.png") var image_09 : String
# 10
@export_file("*.png") var image_10 : String
@export_file("*.png") var image_11 : String
@export_file("*.png") var image_12 : String
@export_file("*.png") var image_13 : String
@export_file("*.png") var image_14 : String
@export_file("*.png") var image_15 : String
@export_file("*.png") var image_16 : String
@export_file("*.png") var image_17 : String
@export_file("*.png") var image_18 : String
@export_file("*.png") var image_19 : String
# 20
@export_file("*.png") var image_20 : String
@export_file("*.png") var image_21 : String
@export_file("*.png") var image_22 : String
@export_file("*.png") var image_23 : String
@export_file("*.png") var image_24 : String
@export_file("*.png") var image_25 : String
@export_file("*.png") var image_26 : String
@export_file("*.png") var image_27 : String
@export_file("*.png") var image_28 : String
@export_file("*.png") var image_29 : String
# 30
@export_file("*.png") var image_30 : String
@export_file("*.png") var image_31 : String
@export_file("*.png") var image_32 : String
@export_file("*.png") var image_33 : String
@export_file("*.png") var image_34 : String
@export_file("*.png") var image_35 : String
@export_file("*.png") var image_36 : String
@export_file("*.png") var image_37 : String
@export_file("*.png") var image_38 : String
@export_file("*.png") var image_39 : String
# 40
@export_file("*.png") var image_40 : String
@export_file("*.png") var image_41 : String
@export_file("*.png") var image_42 : String
@export_file("*.png") var image_43 : String
@export_file("*.png") var image_44 : String
	
func _ready():
	var images : Array = []
	images.push_back(image_00);
	images.push_back(image_01);
	images.push_back(image_02);
	images.push_back(image_03);
	images.push_back(image_04);
	images.push_back(image_05);
	images.push_back(image_06);
	images.push_back(image_07);
	images.push_back(image_08);
	images.push_back(image_09);
	
	images.push_back(image_10);
	images.push_back(image_11);
	images.push_back(image_12);
	images.push_back(image_13);
	images.push_back(image_14);
	images.push_back(image_15);
	images.push_back(image_16);
	images.push_back(image_17);
	images.push_back(image_18);
	images.push_back(image_19);
	
	images.push_back(image_20);
	images.push_back(image_21);
	images.push_back(image_22);
	images.push_back(image_23);
	images.push_back(image_24);
	images.push_back(image_25);
	images.push_back(image_26);
	images.push_back(image_27);
	images.push_back(image_28);
	images.push_back(image_29);
	
	images.push_back(image_30);
	images.push_back(image_31);
	images.push_back(image_32);
	images.push_back(image_33);
	images.push_back(image_34);
	images.push_back(image_35);
	images.push_back(image_36);
	images.push_back(image_37);
	images.push_back(image_38);
	images.push_back(image_39);
	
	images.push_back(image_40);
	images.push_back(image_41);
	images.push_back(image_42);
	images.push_back(image_43);
	images.push_back(image_44);
	
	var count : int = 0
	var texture_array : Texture2DArray = Texture2DArray.new()
	var texture_images : Array = []
	for path in images:
		var image : Image = Image.new()
		image.convert(Image.FORMAT_RGBA8)
		image.load(path)
		texture_images.push_back(image)
		count = count + 1
	
	texture_array.create_from_images(texture_images)
	material.set_shader_param("screen", texture_array)


