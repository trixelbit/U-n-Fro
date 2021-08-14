//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 u_KeyCol1;
uniform vec3 u_KeyCol2;
uniform vec3 u_KeyCol3;
uniform vec3 u_KeyCol4;

uniform vec3 u_SetCol1;
uniform vec3 u_SetCol2;
uniform vec3 u_SetCol3;
uniform vec3 u_SetCol4;


void main()
{
	vec4 pixel = texture2D(gm_BaseTexture, v_vTexcoord.xy);
	
	if(pixel.rgb == u_KeyCol1.rgb)
		pixel.rgb = u_SetCol1.rgb;
	if(pixel.rgb == u_KeyCol2.rgb)
		pixel.rgb = u_SetCol2.rgb;
	if(pixel.rgb == u_KeyCol3.rgb)
		pixel.rgb = u_SetCol3.rgb;
	if(pixel.rgb == u_KeyCol4.rgb)
		pixel.rgb = u_SetCol4.rgb;
		
    gl_FragColor = pixel;
}
