extends Sprite2D


@onready var prompt = $RichTextLabel
@onready var prompt_text = strip_bbcode(prompt.text.to_upper())

func strip_bbcode(source:String) -> String: #Strips the invisible bbcode from prompt
	var regex = RegEx.new()
	regex.compile("\\[.+?\\]")
	return regex.sub(source, "", true)

func get_prompt() -> String:
	print(prompt_text)
	return prompt_text
