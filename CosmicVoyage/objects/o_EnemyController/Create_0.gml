/// @description Insert description here
// Good huntin' to ya ^^

hasSpawned = false;
global.scoreKills = 0;
global.scoreDist = 0;
// 256 is the center ig

// setup for different enviroments/levels
#macro ENV_SPACE 0
#macro ENV_PLANT 1
#macro ENV_WARP  2

global.levelState = ENV_SPACE;

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
vertex_texcoord(testPlane,1,0)
vertex_position_3d(testPlane,256-128-32,0,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,0,32000/64)

vertex_position_3d(testPlane,256-128-32,0,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,0,32000/64)
vertex_position_3d(testPlane,256+128+32,0,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,1,32000/64)
vertex_position_3d(testPlane,256+128+32,-32000,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,1,0)

vertex_end(testPlane);
