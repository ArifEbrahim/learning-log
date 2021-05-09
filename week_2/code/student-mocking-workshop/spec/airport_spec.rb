require 'airport'

RSpec.describe Airport do
  let (:plane) {double :plane}
  let (:weather) {double :weather}
  subject {Airport.new([],weather)}

  describe "when the weather is sunny" do
    before { allow(weather).to receive(:generate).and_return(1)}
    
    it "a plane can land at an airport" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "a second plane can land at the airport" do
      2.times { subject.land(plane) }
      expect(subject.planes.length).to eq(2)
    end

    it "plane takes off and is not at airport" do
      subject.land(plane)
      subject.take_off
      expect(subject.planes).not_to include(plane)
    end

    it "one plane takes off and one is left in airport" do
      2.times { subject.land(plane) }
      subject.take_off
      expect(subject.planes.length).to eq(1)

    end

    it "confirms the plane is no longer at the airport after takeoff" do
      subject.land(plane)
      subject.take_off
      expect(subject.planes).not_to include(plane)
    end

    it "returns true if plane is still at the airport" do
      subject.land(plane)
      expect(subject.plane_at_airport?(plane)).to eq(true)
    end

    it "returns weather is perfect for flying" do
      expect(subject.check_weather("land")).to eq("perfect for flying")
    end
  end

  describe "when the weather is stormy" do
    before { allow(weather).to receive(:generate).and_return(2)}

    it "won't allow takeoff if weather is stormy" do
      expect{ subject.check_weather("take off") }.to raise_error("cannot take off due to stormy weather")
    end

    it "won't allow landing if weather is stormy" do
      expect{ subject.check_weather("land") }.to raise_error("cannot land due to stormy weather")
    end
  end
end
