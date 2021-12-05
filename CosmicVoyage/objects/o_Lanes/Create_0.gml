testPlane = vertex_create_buffer()

vertexQuad = vertex_create_buffer();

vertex_format_begin()
vertex_format_add_position_3d()
vertex_format_add_color()
vertex_format_add_texcoord()
testFormat = vertex_format_end()

#region lane vertex buffer
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
vertex_texcoord(testPlane,0,32000/256)

vertex_position_3d(testPlane,256-128-32,0,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,0,32000/256)
vertex_position_3d(testPlane,256+128+32,0,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,3,32000/256)
vertex_position_3d(testPlane,256+128+32,-32000,64)
vertex_color(testPlane,c_white,1)
vertex_texcoord(testPlane,3,0)

vertex_end(testPlane);
#endregion


vertex_begin(vertexQuad,testFormat)

vertex_position_3d(vertexQuad,-1,0,0)
vertex_color(vertexQuad,c_white,1)
vertex_texcoord(vertexQuad,0,0)

vertex_position_3d(vertexQuad,0,0,0)
vertex_color(vertexQuad,c_white,1)
vertex_texcoord(vertexQuad,1,0)

vertex_position_3d(vertexQuad,-1,1,0)
vertex_color(vertexQuad,c_white,1)
vertex_texcoord(vertexQuad,0,1)

vertex_position_3d(vertexQuad,0,1,0)
vertex_color(vertexQuad,c_white,1)
vertex_texcoord(vertexQuad,0,1)

vertex_position_3d(vertexQuad,1,0,0)
vertex_color(vertexQuad,c_white,1)
vertex_texcoord(vertexQuad,1,0)

vertex_position_3d(vertexQuad,1,1,0)
vertex_color(vertexQuad,c_white,1)
vertex_texcoord(vertexQuad,1,1)

vertex_end(vertexQuad)

objFormat = o_GameManager.objFormat

mPlane = LoadObj("m_ground_plane.obj",vertex_create_buffer())


