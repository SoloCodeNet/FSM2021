extends State

func logic()->void:
	.logic()
	
	pl.calc_physic(dir)
	
	if pl.is_on_wall() and pl.vel.y > 0 and abs(dir)> 0:
		next_state = _states["slide"]
		
	if pl.is_on_floor():
		next_state = _states["idle"]
		
	if pl.vel.y > 0:
		next_state = _states["fall"]
		
func enter()->void:
	pl.jump()
	.enter()
