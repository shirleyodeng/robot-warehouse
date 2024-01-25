require 'robot_controller'
require 'pry'

RSpec.describe RobotController do
  subject { described_class.new(robot) }
  
  let(:robot) { Robot.new(starting_coordinates) }
  let(:starting_coordinates) { [5, 5] }

  let(:command_sequence) { "N,N,E" }

  describe "#call" do
    it "moves the robot according to the command sequence" do
      subject.call(command_sequence)

      expect(robot.coordinates).to eq([6, 3])
    end

    it "returns true" do
      expect(subject.call(command_sequence)).to eq(true)
    end

    context "when the command sequence is invalid" do
      let(:command_sequence) { "X,T" }

      it "raises an InvalidCommandSequence error" do
        expect { subject.call(command_sequence) }
          .to raise_error(described_class::InvalidCommandSequenceError)
      end
    end

    context "when the command sequence is partially invalid" do
      let(:command_sequence) { "N,E,X" }

      it "raises an InvalidCommandSequence error" do
        expect { subject.call(command_sequence) }
          .to raise_error(described_class::InvalidCommandSequenceError)
      end
    end

    context "when the command sequence moves the robot outside the warehouse" do
      let(:command_sequence) { "N" }
      let(:starting_coordinates) { [0, 0] }

      it "raises a Robot::OutsideWarehouse error" do
        expect { subject.call(command_sequence) }
          .to raise_error(Robot::OutsideWarehouseError)
      end
    end
  end
end
