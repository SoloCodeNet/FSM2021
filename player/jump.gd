extends State

func logic()->void:
	.logic()
	pl.apply_dir(dir)
	
	if dir != 0 and dash:
		next_state = _states["dash"]
		
	if pl.vel.y > 0:
		next_state = _states["fall"]
	
	if pl.is_on_wall() and pl.vel.y > 0:
		next_state = _states["slide"]
		
	if jump and pl.jump_count < 2:
		pl.jump_count +=1
		next_state = _states["double"]
		
	if pl.is_on_floor():
		next_state = _states["idle"]


func enter()->void:
	pl.jump()
	.enter()
