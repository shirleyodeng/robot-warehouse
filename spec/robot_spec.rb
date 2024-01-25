require 'robot'

RSpec.describe Robot do
  subject { described_class.new(starting_coordinates) }

  let(:starting_coordinates) { [5, 5] }

  describe "#move!" do
    context "when the command is N" do
      let(:command) { "N" }

      it "moves the robot north" do
        expect { subject.move!(command) }
          .to change { subject.coordinates }
          .from(starting_coordinates)
          .to([5, 4])
      end
    end

    context "when the command is E" do
      let(:command) { "E" }

      it "moves the robot east" do
        expect { subject.move!(command) }
          .to change { subject.coordinates }
          .from(starting_coordinates)
          .to([6, 5])
      end
    end

    context "when the command is S" do
      let(:command) { "S" }

      it "moves the robot south" do
        expect { subject.move!(command) }
          .to change { subject.coordinates }
          .from(starting_coordinates)
          .to([5, 6])
      end
    end

    context "when the command is W" do
      let(:command) { "W" }

      it "moves the robot west" do
        expect { subject.move!(command) }
          .to change { subject.coordinates }
          .from(starting_coordinates)
          .to([4, 5])
      end
    end

    context "when the command is invalid" do
      let(:command) { "X" }

      it "raises an InvalidCommand error" do
        expect { subject.move!(command) }
          .to raise_error(described_class::InvalidCommandError)
      end
    end

    context "when the command moves the robot outside the warehouse" do
      let(:command) { "N" }
      let(:starting_coordinates) { [0, 0] }

      it "raises an OutsideWarehouse error" do
        expect { subject.move!(command) }
          .to raise_error(described_class::OutsideWarehouseError)
      end
    end
  end
end
