extends CharacterBody2D

class_name Enemy

@export var blue = Color("#4682b4")
@export var green = Color("#639795")
@export var red = Color("#a65455")
@export var white = Color("#ffffff")



@onready var prompt = $RichTextLabel
@onready var prompt_text

func _ready() -> void:
	prompt_text = PromptList.get_prompt()
	prompt_text = prompt_text.to_upper()
	prompt.parse_bbcode(set_center_tags(prompt_text))


func strip_bbcode(source:String) -> String: #Strips the invisible bbcode from prompt
	var regex = RegEx.new()
	regex.compile("\\[.+?\\]")
	return regex.sub(source, "", true)

func get_prompt() -> String:
	return prompt_text

func set_next_character(next_character_index: int):
	var blue_text = get_bbcode_color_tag(blue) + prompt_text.substr(0, next_character_index) + get_bbcode_end_color_tag()
	var green_text = get_bbcode_color_tag(green) + prompt_text.substr(next_character_index, 1) + get_bbcode_end_color_tag()
	var red_text = ""
	if next_character_index != prompt_text.length():
		red_text = get_bbcode_color_tag(red) + prompt_text.substr(next_character_index + 1, prompt_text.length() - next_character_index + 1) + get_bbcode_end_color_tag()
	prompt.parse_bbcode(set_center_tags(blue_text + green_text + red_text))
	
func reset_prompt():
	prompt.parse_bbcode(set_center_tags(get_bbcode_color_tag(white) + prompt_text + get_bbcode_end_color_tag()))
	
func set_center_tags(string_to_center: String):
	return "[center]" + string_to_center + "[/center]"
	
func get_bbcode_color_tag(color: Color) -> String:
	return "[color=#" + color.to_html(false) + "]"

func get_bbcode_end_color_tag() -> String:
	return "[/color]"
