extends Node

var DataPool : Array
signal New_Data(debugData)

func New(id:String):
	var data = Data.new(id)
	DataPool.append(data)
	emit_signal("New_Data", data)
	return data

class Data:
	var id:String
	var logPool : Array
	signal Update_Log(debugData)
	
	func _init(id:String):
		self.id = id
		
	func _has_log(logData:LogData) -> bool:
		var out:=false
		for _log in logPool:
			if logData._is(_log):
				out = true
		return out
	func _get_log(logData:LogData) -> int:
		var out := -1
		for i in len(logPool):
			var _log = logPool[i]
			if logData._is(_log):
				out=i
		return out
	
	func _print_logs() -> String:
		var out = ""
		for _log in logPool:
			out += _log._to_string()+"\n"
		return out
	
	func Log(id:String, data):
		var new_log := LogData.new(id, data)
		if _has_log(new_log):
			var indx = _get_log(new_log)
			logPool[indx] = new_log
		else:
			logPool.append(new_log)
		emit_signal("Update_Log", self)

class LogData:
	var id:String
	var data
	func _init(id:String, data):
		self.id = id
		self.data = data
	
	func _to_string() -> String:
		return str(self.id)+": "+str(self.data)
	
	func _is(a:LogData) -> bool:
		if self.id.hash() == a.id.hash():return true
		else: return false



