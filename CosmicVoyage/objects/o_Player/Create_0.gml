origin = x;

camera = instance_create_layer(x, (y + 100), "Camera", o_Camera);
camera.z = 20;
camera.targetX = x;
camera.targetY = y;
camera.targetZ = z;