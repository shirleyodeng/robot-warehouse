require 'robot'

class RobotController
  class InvalidCommandSequenceError < StandardError; end

  def initialize(robot)
    @robot = robot
  end

  def call(command_sequence)
    commands = command_sequence.split(",")
    validate_commands!(commands)
    commands.each { |command| robot.move!(command) }
    true
  end

  private

  attr_reader :robot

  def validate_commands!(commands)
    return true if commands.all? { |command| Robot::VALID_COMMANDS.include?(command) }

    raise InvalidCommandSequenceError
  end
end