extends MarginContainer

export var VisibleOnStart := true

const LogPrefab = preload("res://Debug/assets/LogPrefab.tscn")
onready var uiPool = get_node("HSplitContainer/VBoxContainer/ScrollContainer/UIPool")

onready var viewPool:Array


func _ready():
	Debug.connect("New_Data", self, "_new_DataView")
	if !VisibleOnStart:
		self.visible = false
		
		
func _new_DataView(data:Debug.Data):
	#create ui instances and parent them to the UIPool node
	var instance = LogPrefab.instance()
	viewPool.append(instance)
	uiPool.add_child(instance)
	instance._set_data(data)


func _input(event):
	#print("input")
	if Input.is_key_pressed(KEY_BACKSPACE):
		self.visible = !self.visible
