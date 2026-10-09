shader_type canvas_item;

uniform float line_width = 0.5;
uniform float spacing = 0.4;
uniform float time_per_cycle = 8.0;

void fragment() {
	float adjusted_spacing = spacing + line_width;
	
	float diagonal = (UV.x - UV.y) + (TIME/time_per_cycle);
	float spaced_diagonal = mod(diagonal, adjusted_spacing);
	
	if (spaced_diagonal < line_width) {
		COLOR = texture(TEXTURE, UV);
		COLOR *= vec4(0.75, 0.75, 0.8, 1.0);
	}
}