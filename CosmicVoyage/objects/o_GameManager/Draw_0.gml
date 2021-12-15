/// @description Insert description here
// Good huntin' to ya ^^

if currentState != GameState.Intro
	{


		surface_set_target(s_screen)
		draw_set_font(f_Screen)
		draw_clear_alpha(c_navy,1)
		draw_set_color(c_orange)
		//draw_rectangle(0,0,100,100,false)
		draw_set_halign(fa_center)
		draw_set_valign(fa_top)
		if gameStart == false
			{
				draw_text(512,0,"YOUR BEST SCORE IS...");
				// blinker goes off every 1000 ticks, spends half of that time on/off
				if current_time-(floor((current_time/1000))*1000) < 500
					{
						draw_text(512,512-128,"[READY TO LAUNCH]");
					}
				draw_set_valign(fa_middle);
				matrix_set(matrix_world,matrix_build(0,0,0,0,0,0,1,4,1));
				draw_set_color(c_aqua);
				draw_text(512,256/4,"124 293 203 PTS!!!!");
				matrix_set(matrix_world,matrix_build_identity());
			}
		else
			{
				draw_set_halign(fa_center)
				draw_set_valign(fa_middle)
				s_scale = 3.5*(gameCountdown/100)-(floor(gameCountdown/100))
				matrix_set(matrix_world,matrix_build(0,0,0,0,0,0,s_scale,s_scale,1));
				if gameCountdown > 0
					{
						
						draw_text(512/s_scale,256/s_scale,ceil(gameCountdown/100));
					}
				else
					{
						matrix_set(matrix_world,matrix_build(0,0,0,0,0,0,2.5,2.5,1));
						draw_text(512/2.5,256/2.5,"LIFTOFF!!!");
					}
				matrix_set(matrix_world,matrix_build_identity());
			}
		draw_set_font(f_Temp)
		surface_reset_target()

		matrix_set(matrix_world,matrix_build(256,room_height-1400,0,0,0,90,50,50,50));
		vertex_submit(m_Hangar,pr_trianglelist,sprite_get_texture(t_Hangar,0));
		//if s_screen != undefined
			{
		vertex_submit(m_HangarScreen,pr_trianglelist,surface_get_texture(s_screen));
			}
		matrix_set(matrix_world,matrix_build_identity());
		shader_set(sh_HangarShip)
		if currentState == GameState.Menu
			{
		matrix_set(matrix_world,matrix_build(256,room_height-512,0,0,0,270,20,20,20))
		vertex_submit(m_PlayerShip,pr_trianglelist,sprite_get_texture(spr_Ship3D,0))
		matrix_set(matrix_world,matrix_build_identity())
			}
		shader_reset()
		if instance_exists(o_Player)
			{
		for(i = 0; i < 10; i++)
			{
		matrix_set(matrix_world,matrix_build(256,-1500+(i*-1024+256),-64*4,0,0,90,3,3,3))
		vertex_submit(m_testTube,pr_trianglelist,sprite_get_texture(spr_testuv,0))
		matrix_set(matrix_world,matrix_build_identity())
			};
			}
	}
/*
if currentState == GameState.Game || currentState == GameState.Multiplayer
	{
		if random(100) > 75
			{
				starSide = choose(0,1)
				if starSide = 0
					{
						instance_create_layer(0+random(-256),o_Player.y-4096,"Instances",o_Stars)	
					}
				else
					{
						instance_create_layer((256+128)+random(256),o_Player.y-4096,"Instances",o_Stars)	
					}
				}
		
	}