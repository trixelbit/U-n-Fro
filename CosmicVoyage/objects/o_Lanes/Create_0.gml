testPlane = vertex_create_buffer()

vertex_format_begin()
vertex_format_add_position_3d()
vertex_format_add_color()
vertex_format_add_texcoord()
testFormat = vertex_format_end()


vertex_begin(testPlane,testFormat)
vRep = 100;
vertex_position_3d(testPlane,256-128-32,-32000,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,0,0)
vertex_position_3d(testPlane,256+128+32,-32000,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,3,0)
vertex_position_3d(testPlane,256-128-32,0,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,0,32000/64)

vertex_position_3d(testPlane,256-128-32,0,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,0,32000/64)
vertex_position_3d(testPlane,256+128+32,0,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,3,32000/64)
vertex_position_3d(testPlane,256+128+32,-32000,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,3,0)


#macro primCol1 make_color_rgb(255,194,147)
#macro primCol2 make_color_rgb(255,109,132)
#macro primCol3 make_color_rgb(184,56,130 )
#macro primCol4 make_color_rgb(93,35,91   )

#macro pal0Col1 make_color_rgb(136,220,60 )
#macro pal0Col2 make_color_rgb(58,170,106 )
#macro pal0Col3 make_color_rgb(76,103,120 )
#macro pal0Col4 make_color_rgb(37,75,73   )

#macro pal1Col1 make_color_rgb(151,250,255 )
#macro pal1Col2 make_color_rgb(15,133,255 )
#macro pal1Col3 make_color_rgb(56,73,184 )
#macro pal1Col4 make_color_rgb(93,35,82   )


// palette colors
global.keyCol1 = primCol1;
global.keyCol2 = primCol2;
global.keyCol3 = primCol3;
global.keyCol4 = primCol4;

global.dstCol1 = primCol1;
global.dstCol2 = primCol2;
global.dstCol3 = primCol3;
global.dstCol4 = primCol4;



vertex_end(testPlane);

