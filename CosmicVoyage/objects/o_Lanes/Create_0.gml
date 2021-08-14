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


// palette colors
global.keyCol1 = make_color_rgb(255,194,147);
global.keyCol2 = make_color_rgb(255,109,132);
global.keyCol3 = make_color_rgb(184,56,130);
global.keyCol4 = make_color_rgb(93,35,91);

global.dstCol1 = make_color_rgb(136,220,60);
global.dstCol2 = make_color_rgb( 58,170,106);
global.dstCol3 = make_color_rgb( 76,103,120);
global.dstCol4 = make_color_rgb( 37,075,073);



vertex_end(testPlane);

