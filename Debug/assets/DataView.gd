extends PanelContainer

var myData:Debug.Data

onready var ui_id = get_node("VBoxContainer/id")
onready var ui_logdata = get_node("VBoxContainer/log_data")

func _ready():

	pass
	
func _set_data(data:Debug.Data):
	myData = data
	ui_id.text = data.id
	ui_logdata.text = data._print_logs()
	myData.connect("Update_Log", self, "_update_log")

func _update_log(data:Debug.Data):
	ui_logdata.text = data._print_logs()
	pass
