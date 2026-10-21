function gripper_state_callback(message)

global gripper_state

gripper_state = message.position;

end