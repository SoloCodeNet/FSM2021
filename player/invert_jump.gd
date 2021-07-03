extends State
var dir_invert:=0.0
var last_dir := 0.0

func logic()->void:
	.logic()
	
	if pl.is_timed:
		dir_invert = last_dir
		pl.accel = pl.DEFAULT_ACCEL * 1.2
	else:
		dir_invert = dir
		pl.accel = pl.DEFAULT_ACCEL * 0.01 

	
	pl.apply_dir(dir_invert)
	
#	if pl.is_timed == false:
#		next_state = _states["idle"]
		
	if pl.vel.y > 0:
		next_state = _states["fall"]

		
	if pl.is_on_wall() and pl.vel.y > 0:
		next_state = _states["slide"]
		
	if pl.is_on_floor():
		next_state = _states["idle"]
		
func enter()->void:
	if pl.next_to_left():last_dir = 1.5
	if pl.next_to_right():last_dir = -1.5
	pl.dash(0.1)
	pl.jump(1.35)
	.enter()
