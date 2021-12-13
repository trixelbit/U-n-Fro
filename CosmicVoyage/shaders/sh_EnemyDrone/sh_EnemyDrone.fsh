//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_Charge; 
void main()
{
	
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord);
	vec4 pixel = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	// Recolors the eye bit on the drone
	if (greaterThan(tex,vec4(0.8)) == true)
		pixel = vec4(u_Charge,1.0-u_Charge,1.0-u_Charge,1.0) * tex;
		
	if (lessThan(vec2(u_Charge),vec2(0.1)) == true)
		pixel = vec4(1.0-u_Charge,1.0,1.0,1.0) * tex;
		
	gl_FragColor = pixel;

}
