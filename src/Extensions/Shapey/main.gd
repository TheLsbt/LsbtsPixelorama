extends Node2D


var shapey_button: Button = null


func _enter_tree() -> void:
	shapey_button = Button.new()
	shapey_button.text = "Shapey"

	var top_menu_container = Global.control.find_child("TopMenuContainer")
	var hbox: HBoxContainer = top_menu_container.get_node("MarginContainer/HBoxContainer")

	top_menu_container.add_child(shapey_button)


	Global.cel_switched.connect(
		func(): print("Imprinted image")
	)
	var scene = preload("res://src/Extensions/Rooted/scenes/main_panel.tscn").instantiate()
	Global.control.find_child("UI").add_child(scene)




func _exit_tree() -> void:
	if shapey_button:
		shapey_button.queue_free()



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		var size: Vector2i = Global.current_project.size
		var img = Image.create_empty(size.x, size.y, false, Image.FORMAT_RGBA8)
		img.set_pixel(0, 0, Color(randf(), randf(), randf()))
		var cframe = Global.current_project.current_frame
		var clayer = Global.current_project.current_layer
		ExtensionsApi.project.set_pixelcel_image(img, cframe, clayer)
