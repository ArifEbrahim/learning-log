require 'exercise1'

RSpec.describe "#store_name" do
  it "confirms a name was stored" do
    expect(store_name("Bob")).to eq("Name stored!")
  end
end