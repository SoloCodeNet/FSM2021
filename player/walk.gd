extends State

func logic()->void:
	.logic()
	pl.apply_dir(dir)
	
	if dir == 0:
		next_state = _states["idle"]
		
	if jump:
		next_state = _states["jump"]
		
	if dash:
		next_state = _states["dash"]
		
	if pl.vel.y > 0:
		next_state = _states["fall"]

