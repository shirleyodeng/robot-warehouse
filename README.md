# Robot Warehouse

We have installed a robot in our warehouse. You are able to send it commands to control it. The robot moves along a grid in the roof of the warehouse and we have
made sure that all of our warehouses are built so that the dimensions of the grid are 10 by 10. We've also made sure that all our warehouses are aligned along north-south and east-west axes.

## Installation

```
bundle install
```

## Usage

Initialize a robot with starting coordinates:
```
robot = Robot.new([5, 5])
=> #<Robot:0x0000000106d7aa08 @coordinates=[5, 5], @starting_coordinates=[5, 5]>
```

Initialize a robot controller with the robot:
```
robot_controller = RobotController.new(robot)
=> #<RobotController:0x0000000106d914b0 @robot=#<Robot:0x0000000106d7aa08 @coordinates=[5, 5], @starting_coordinates=[5, 5]>>
```

Control the robot by calling the robot controller with a command sequence:
```
robot_controller.call("N,N,E")
=> true
robot
=> #<Robot:0x0000000106d7aa08 @coordinates=[6, 3], @starting_coordinates=[5, 5]>
robot_controller.call("S,W,W,N")
=> true
robot
=> #<Robot:0x0000000106d7aa08 @coordinates=[4, 3], @starting_coordinates=[5, 5]>
```

## Notes

### Commands

Commands consist of a single capital letter.

The robot accepts the following commands:
* N moves north
* W moves west
* E moves east
* S moves south

### Command Sequences

Command sequences consist of commands that are comma separated.

For example,
* "N,E,S,W" will move the robot in a full square, returning it to where it started.
* "N,E,N,E,N,E,N,E" will move the robot to the middle of the warehouse if the robot starts in the south-west corner of the warehouse.

## Tests

```
bundle exec rspec
```
