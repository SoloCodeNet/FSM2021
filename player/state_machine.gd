extends Node2D
class_name StateMachine

var current_state
var _states:Dictionary

func _ready() -> void:
	yield(get_parent(),"ready")

	for state in get_children():
		_states[state.name] = state
		
	for state in get_children():
		state._states = self._states
		state.pl = owner

	current_state  = get_node(_states["idle"].get_path())
	
func _physics_process(_delta: float) -> void:
	current_state.logic()
	if current_state.get_transition() != null:
		change_state(current_state.get_transition())
		
func enter_state() -> void:
	current_state.enter()
	
func change_state(nextstate: State)->void:
	current_state = nextstate
	enter_state()
