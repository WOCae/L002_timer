extends Node

@onready var timer: Timer = $Timer
@onready var button1: Button = $Button1
@onready var button2: Button = $Button2
@onready var label: Label = $Label

# タイマーの状態
var is_running: bool = false
var elapsed_time: float = 0.0

func _ready():
	button1.text = "Start Timer"
	button2.text = "Reset Timer"
	# シグナル接続
	button1.pressed.connect(_on_button1_pressed)
	button2.pressed.connect(_on_button2_pressed)
	timer.timeout.connect(_on_timer_timeout)
	label.text = "Elapsed Time: 0.0"

func _on_button1_pressed():
	if is_running:
		# タイマー停止
		timer.stop()
		is_running = false
		button1.text = "Start Timer"
	else:
		# タイマー開始
		timer.start()
		is_running = true
		button1.text = "Stop Timer"

func _on_button2_pressed():
	# タイマーをリセット
	timer.stop()
	is_running = false
	elapsed_time = 0.0
	label.text = "Elapsed Time: 0.0"
	button1.text = "Start Timer"

func _on_timer_timeout():
	# 経過時間を更新
	elapsed_time += timer.wait_time
	#label.text = "Elapsed Time: %.1f".format(elapsed_time)  # フォーマットで小数点以下1桁
	#label.text = str(elapsed_time)
	label.text = "Elapsed Time:" +"%4.1f" %  elapsed_time
