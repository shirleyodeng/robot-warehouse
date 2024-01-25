class Robot
  class InvalidCommandError < StandardError; end

  class OutsideWarehouseError < StandardError; end

  VALID_COMMANDS = %w[N E S W].freeze

  attr_reader :coordinates, :starting_coordinates

  def initialize(starting_coordinates = [0, 0])
    validate_coordinates!(starting_coordinates)

    @coordinates = starting_coordinates.dup
    @starting_coordinates = starting_coordinates
  end

  def move!(command)
    validate_command!(command)

    case command
    when "N"
      coordinates[1] -= 1
    when "E"
      coordinates[0] += 1
    when "S"
      coordinates[1] += 1
    when "W"
      coordinates[0] -= 1
    end

    validate_coordinates!(coordinates)
  end

  private

  def validate_command!(command)
    return true if VALID_COMMANDS.include?(command)

    raise InvalidCommandError
  end

  def validate_coordinates!(coordinates)
    return true if coordinates.all? { |coordinate| coordinate.between?(0, 9) }

    raise OutsideWarehouseError
  end
end
