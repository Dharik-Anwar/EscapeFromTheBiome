extends Control


onready var scene_tree: = get_tree()
onready var HP: Label = get_node("HP")
onready var Bullets: Label = get_node("Bullets")
onready var score: Label = get_node("Score")
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var paused_title: Label = get_node("PauseOverlay/Title")

const Dead_Message: = "You Die"

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_die")
	PlayerData.connect("player_attacked", self, "update_interface")
	PlayerData.connect("bullet_changed", self, "update_interface")
	update_interface()
	


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and pause_overlay.visible == false and paused_title.text != Dead_Message:
		self.paused = not paused
		scene_tree.set_input_as_handled()


func _on_PlayerData_player_die() -> void:
	self.paused = true
	paused_title.text = Dead_Message
	get_node("PauseOverlay/PauseMenu/ContinueButton").disabled = true



func update_interface() -> void:
	score.text = "Score : %s" % PlayerData.score
	HP.text = "HP : %s" % PlayerData.HP
	Bullets.text = "Bullets : %s" % PlayerData.No_of_bullets


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value


func _on_ContinueButton_button_up() -> void:
	if paused_title.text != Dead_Message:
		scene_tree.paused = false
		pause_overlay.visible = false
