# myCobot280-Pick-Place
MATLAB-based trajectory planning, inverse kinematics, ROS 2 control, and motion analysis for the myCobot280, 6 Degrees of Freedom robotic arm.

## Overview
This project generates Cartesian trajectories from a set of board-based waypoints and converts the planned end-effector poses into joint configurations using inverse kinematics.

The controller communicates with the robot through ROS 2, sends joint-position commands, controls the gripper, and records joint-state and gripper-state data for post-execution analysis.

The project also uses MATLAB forward kinematics to reconstruct the end-effector's Cartesian motion and plots position, velocity, acceleration, and gripper state against time.

## Features
Cartesian waypoint generation from board coordinates.
Trajectory generation using MATLAB's cubicpolytraj.
Inverse kinematics for intermediate trajectory points.
Sequential inverse-kinematics solutions using previous joint configurations as initial guesses.
ROS 2 communication for robot joint commands and gripper control.
Recording of joint-state and gripper-state data.
Forward-kinematics reconstruction of end-effector positions.
Plotting of Cartesian position, velocity, acceleration, and gripper state.
MATLAB robot-model simulation.
Technologies
MATLAB
Robotics System Toolbox
ROS Toolbox
ROS 2
URDF robot description
myCobot 280
Exact MATLAB release, ROS 2 distribution, and robot configuration should be documented for the environment in which the project is tested.

## Project Structure

mycobot-trajectory-controller/
├── README.md
├── mycobot_trajectory_controller.m
└── mycobot_280_no_sbc/
    └── Robot description and required resources

The helper functions may instead be defined as local functions in the main MATLAB file. Include all required URDF, mesh, and other robot-description resources.

## Requirements
Before running the controller, ensure that you have:

MATLAB with the required robotics and ROS functionality.
Robotics System Toolbox and ROS Toolbox.
A compatible ROS 2 installation and working MATLAB-to-ROS 2 communication.
The correct myCobot 280 robot description and its required mesh files.
The helper functions used by the controller, including getBoardCoordinates and simulate_ik.
A compatible robot configuration and ROS 2 topics for joint commands, joint states, and gripper commands.
The ROS 2 topic names and message types must match those used by your robot's ROS 2 setup.

## Setup
Clone or download this repository.
Open MATLAB and set the current working directory to the repository root.
Check that the robot description is available at the relative path expected by the script.
Add the helper-function locations to the MATLAB path if necessary.
Configure and start the compatible ROS 2 environment.
Confirm that the required topics and message types are available.
Test the trajectory in simulation before enabling physical robot execution.
Running the Controller
Run the following command from MATLAB:


mycobot_trajectory_controller
The controller performs the following high-level steps:

Initialises ROS 2 publishers and subscribers.
Loads the robot model and initial joint configuration.
Converts board coordinates into Cartesian waypoint displacements.
Generates a Cartesian trajectory between waypoints.
Calculates inverse-kinematics solutions along the trajectory.
Simulates the planned trajectory.
Sends joint commands and gripper commands through ROS 2.
Records joint-state and gripper-state data.
Saves the recorded data and generates trajectory plots.
The actual execution sequence depends on the robot configuration and the ROS 2 environment.

## Output
The controller saves recorded data to:


robot_trajectory_and_gripper_data.mat
The plotting section uses the recorded joint configurations and the robot model to reconstruct end-effector Cartesian positions.

The generated plots show:

Position: Cartesian X, Y, and Z against time.
Velocity: Cartesian velocity components against time.
Acceleration: Cartesian acceleration components against time.
Gripper: Recorded gripper state against time.
Velocity and acceleration estimates depend on the sampling interval used in the analysis. If the recording interval varies, measured timestamps should be used for more accurate derivatives.

## Safety Notice
This project can send commands to a physical robotic arm.

Test in simulation before operating physical hardware.
Verify waypoint coordinates, joint configurations, workspace limits, and gripper behaviour before execution.
Keep the robot's workspace clear and follow the manufacturer's operating and safety guidance.
Confirm that the ROS 2 topics connect to the intended robot before publishing commands.
Do not assume that successful inverse kinematics guarantees collision-free or mechanically safe motion.
Use this software at your own risk.

## Limitations
The controller depends on the robot model and ROS 2 configuration matching the physical hardware.
Trajectory execution may differ from the planned trajectory because of communication delays and robot dynamics.
Cartesian velocity and acceleration reconstructed from joint-state samples depend on the accuracy of the sampling interval.
Collision avoidance and comprehensive motion validation are not guaranteed by the trajectory-generation code.

## Acknowledgements
This project uses MATLAB robotics toolbox and a myCobot 280 robot.

## Author
Dev S
