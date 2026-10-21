function itree_one_way_interface

robot = importrobot("mycobot_280_no_sbc/mycobot_280_no_sbc.urdf");

hz = 30;

interactive_robot = interactiveRigidBodyTree(robot, 'Frames', 'off');

xlim(gca, [-0.25, 0.25])
ylim(gca, [-0.25, 0.25])
zlim(gca, [-0.1, 0.5])

client_node =     ros2node('/jetcobot_client', 95);

joint_publisher = ros2publisher(client_node, '/jetcobot/matlab_joint_command', 'sensor_msgs/JointState');

joint_command_message = ros2message("sensor_msgs/JointState");

configuration = interactive_robot.Configuration;

timer = rateControl(hz);

while(isgraphics(gca))

    waitfor(timer);

    configuration = interactive_robot.Configuration;

    joint_command_message.position = configuration;

    joint_publisher.send(joint_command_message);

end