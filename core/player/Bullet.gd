extends Area
class_name Bullet

signal hit

export var muzzle_velocity = 25
export var g = Vector3.DOWN * 20

var velocity = Vector3.ZERO

func _physics_process(delta):
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	transform.origin += velocity * delta


func _on_RigidBody_body_entered(body: Node) -> void:
	emit_signal("hit", transform.origin)
	queue_free()
	
	if body is Cube:
		PowerManager.power_object(body)