//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 fColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (fColor.a < 0.01) discard;
	gl_FragColor = fColor;
}
