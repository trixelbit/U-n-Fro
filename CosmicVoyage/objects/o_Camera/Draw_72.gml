// Get camera for rendering
camera = camera_get_active();

// Enable z-testing
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

// Matrices for 3D perspective
projMat = matrix_build_projection_perspective_fov(60, window_get_width() / window_get_height(), 1, 32000);
lookMat = matrix_build_lookat(x, y, z, targetX, targetY, targetZ, 0, 0, 1);

// Set perspective viewpoint
camera_set_proj_mat(camera, projMat);

// Set view matrix
camera_set_view_mat(camera, lookMat);

// Clear buffer
draw_clear(c_black);

// Apply camera settings
camera_apply(camera);