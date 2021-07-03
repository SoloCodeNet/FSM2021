extends State

func logic()->void:
	.logic()
	pl.vel.y = 0.0
	pl.accel = 0.5
	pl.vel.x =  (pl.DEFAULT_SPEED * 3) * pl.old_dir
	pl.apply_dir(pl.old_dir)
	
	if pl.stop_dash():
		next_state = _states["idle"]
	
	if pl.is_timed == false and ! pl.check_top():
		next_state = _states["idle"]
		
func enter()->void:
	pl.dash(0.3)
	.enter()
	
