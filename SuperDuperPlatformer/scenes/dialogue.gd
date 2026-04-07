extends Control
var dialog: Array[String]
var index = 1
@onready var canvas := get_parent()
@onready var writing = $Control/VBoxContainer/RichTextLabel #I am running OUT of good variable names
signal dialogDone
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(dialog)
	print(dialog.size())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dialog.size() >= 1:
		writing.text = String(dialog[index-1]) 
	pass


func _on_button_pressed() -> void:
	print(dialog.size())
	if index + 1 < dialog.size():
		index += 1
	else:
		print(canvas)
		dialogDone.connect(canvas.on_dialog_done)
		dialogDone.emit()
		queue_free()
	pass # Replace with function body.
