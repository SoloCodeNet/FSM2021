extends State

func logic()->void:
	.logic()
	pl.accel = pl.DEFAULT_ACCEL
	pl.calc_physic(dir)
	
	if dir != 0:
		next_state = _states["walk"]
		
	if jump:
		next_state = _states["jump"]
		
	if pl.vel.y > 0:
		next_state = _states["fall"]
