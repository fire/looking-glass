shader_type canvas_item;

uniform float calibration_width = 1536;
uniform float calibration_height = 2048;
uniform highp float calibration_slope = -7.142918822023782;
uniform highp float calibration_pitch = 52.58654117140743;
uniform highp float calibration_center = 0.17349151971857157;
uniform float calibration_dpi = 324.0;

uniform int NUM_FRAMES = 45;
uniform sampler2DArray screen;

int determine_view(float a) {
    int res = NUM_FRAMES - 1;
    a = mod(a, 1) * float(NUM_FRAMES);
    res -= int(a);
    return res;
}   

void fragment() {
	// Physical image width
	const float screen_inches = calibration_width / calibration_dpi;
	const float pitch = calibration_pitch * screen_inches * cos(atan(1.0/calibration_slope));
	const float tilt = float(calibration_height)/(calibration_width * calibration_slope);
	const float subpixel = 1.0 / (3.0*calibration_width) * pitch;

	float u = UV.x;
	float v = UV.y;
    float a = (u + (1.0 - v)*tilt)*pitch - calibration_center;
	
	// Change from coordinate system of the output uvs to the
	// coordinate system of the tile uvs
	// From 1536x2048 
	// to 455x819
	// TODO
	
	// Red
    int view = determine_view(a);
    float r = texture(screen, vec3(float(u), float(v), float(view))).r;
    
    // Green
    view = determine_view(a+subpixel);
    float g = texture(screen, vec3(float(u), float(v), float(view))).g;
    
    // Blue
    view = determine_view(a+2.0*subpixel);
    float b = texture(screen, vec3(float(u), float(v), float(view))).b;
	
	vec3 rgb = vec3(r, g, b);
	COLOR.rgb = rgb;
}