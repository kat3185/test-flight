require_relative "../../lib/airplane"

describe Airplane do
  let (:my_plane) { Airplane.new("cesna", 10, 150, 100) }


  describe "#initialization" do
    it 'has a type' do
      expect(my_plane.type).to eq("cesna")
    end

    it 'has a wing load' do
      expect(my_plane.wing_loading).to eq(10)
    end

    it 'has horsepower' do
      expect(my_plane.horsepower).to eq(150)
    end

    it 'has fuel' do
      expect(my_plane.fuel).to eq(100)
    end

  end

  describe "#land" do
    it "lands the plane if it is in the air" do
      my_plane.start
      my_plane.takeoff
      expect(my_plane.land).to eq("airplane landed")
    end
    it 'will not land if the plane is on the ground' do
      my_plane.start
      expect(my_plane.land).to eq('airplane already on the ground')
    end
    it 'tells you to start the plane if it is not already started' do
      expect(my_plane.land).to eq("airplane not started, please start")
    end
    it 'crashes if it lacks the fuel to land' do
      crash_plane = Airplane.new("cesna", 10, 150, 80)
      crash_plane.start
      crash_plane.takeoff
      expect(crash_plane.land).to eq('not enough fuel! you crash.')
    end
  end

  describe "#takeoff" do
    it "takes off if the engine is on" do
      my_plane.start
      expect(my_plane.takeoff).to eq("airplane launched")
    end
    it "will not take off unless the engine is on" do
      expect(my_plane.takeoff). to eq("airplane not started, please start")
    end
    it "will not take off if it is already flying" do
      my_plane.start
      my_plane.takeoff
      expect(my_plane.takeoff).to eq('the airplane is already in the air')
    end
    it 'wont take off unless it has enough fuel' do
      no_takeoff_plane = Airplane.new("cesna", 10, 150, 50)
      no_takeoff_plane.start
      expect(no_takeoff_plane.takeoff).to eq('not enough fuel!')
    end
  end

  describe "#start" do
    it 'starts the engine if it is not running' do
      expect(my_plane.start).to eq("airplane started")
    end
    it 'tells you if the engine is already running' do
      my_plane.start
      expect(my_plane.start).to eq("airplane already started")
    end
    it 'will not start unless it has enough fuel' do
      no_start_plane = Airplane.new("cesna", 10, 150, 20)
      expect(no_start_plane.start).to eq('not enough fuel!')
    end
  end
end
