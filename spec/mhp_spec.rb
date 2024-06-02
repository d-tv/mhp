# frozen_string_literal: true

require "mhp"

RSpec.describe Mhp do
  describe "init_doors" do
    it "returns an array of the given size" do
      number_of_doors = 3
      doors = Mhp.init_doors(number_of_doors)
      expect(doors.size).to eq(number_of_doors)
    end
  
    it "returns an array with one value true and other ones false" do
      doors = Mhp.init_doors(3)
      expect(doors.count(true)).to eq(1)
      expect(doors.count(false)).to eq(2)
    end
  end
  
  describe "play" do
    it "raises an exception if the choice is not within the range" do
      expect { Mhp.play(3, true) }.to raise_error(ArgumentError)
    end
  
    it "returns true if the player wins and returns false if the player loses" do
      expect(Mhp.play(0, true)).to be(true).or be(false)
    end
  end
  
  describe "simulate" do
    it "returns a hash with empty results if there is no iteration" do
      result = Mhp.simulate(0)
      expect(result["success"]).to eq(0)
      expect(result["failure"]).to eq(0)
    end
  
    it "returns more successes than failures with switching" do
      result = Mhp.simulate(10000, true)
      expect(result["success"]).to be > result["failure"]
    end
  
    it "returns more failures than successes without switching" do
      result = Mhp.simulate(10000, false)
      expect(result["failure"]).to be > result["success"]
    end
  end
end
