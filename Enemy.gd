extends Sprite2D


@export var blue = Color("#4682b4")
@export var green = Color("#639795")
@export var red = Color("#a65455")

@export var speed = 0.1

@onready var prompt = $RichTextLabel
@onready var prompt_text = strip_bbcode(prompt.text.to_upper())

func strip_bbcode(source:String) -> String: #Strips the invisible bbcode from prompt
	var regex = RegEx.new()
	regex.compile("\\[.+?\\]")
	return regex.sub(source, "", true)

func get_prompt() -> String:
	print(prompt_text)
	return prompt_text

func set_next_character(next_character_index: int):
	var blue_text = get_bbcode_color_tag(blue) + prompt_text.substr(0, next_character_index) + get_bbcode_end_color_tag()
	var green_text = get_bbcode_color_tag(green) + prompt_text.substr(next_character_index, 1) + get_bbcode_end_color_tag()
	var red_text = ""
	if next_character_index != prompt_text.length():
		red_text = get_bbcode_color_tag(red) + prompt_text.substr(next_character_index + 1, prompt_text.length() - next_character_index + 1) + get_bbcode_end_color_tag()
	prompt.parse_bbcode("[center]" + blue_text + green_text + red_text + "[/center]")
	
func get_bbcode_color_tag(color: Color) -> String:
	return "[color=#" + color.to_html(false) + "]"

func get_bbcode_end_color_tag() -> String:
	return "[/color]"
