function joint_state_callback(message)

global joint_state_history
global record_joint_state

if record_joint_state

    joint_state_history = [joint_state_history; message.position'];

end
