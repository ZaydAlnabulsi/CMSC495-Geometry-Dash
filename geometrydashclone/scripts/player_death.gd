extends Area2D

func _on_body_entered(body):
	if body.is_in_group("kill") :
		$"..".death()
		self.queue_free() 
