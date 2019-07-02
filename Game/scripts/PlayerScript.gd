extends Node2D

var speed = 150
var verticalMovement = 0
const MAX_VERTICAL_MOVEMENT = 200
  
func _process(delta):
  move_local_x(speed*delta)
  if(self.position.y > 1  && self.position.y <= get_viewport_rect().size.y):
    move_local_y(verticalMovement*delta)
  else:
    if(self.position.y < 1): 
      move_local_y(10) #Bounce off top
      verticalMovement = 0
    if(self.position.y > get_viewport_rect().size.y): 
      move_local_y(-10) #Bounce off bottom
      verticalMovement = 0
func _input(event):
  if(event.is_action("PLAYER_UP")):
    if(verticalMovement >= -MAX_VERTICAL_MOVEMENT):
      verticalMovement-=10
  if(event.is_action("PLAYER_DOWN")):
    if(verticalMovement <= MAX_VERTICAL_MOVEMENT):
      verticalMovement+=10
  if(event.is_action("PLAYER_SHOOT")):
    pass #We will do this later