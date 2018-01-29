require "spec_helper"

describe Array do
  context "#all_empty?" do
    it "returns true if all elements of the Array are empty" do
      expect(["", "", ""].all_empty?).to eq true
    end

    it "returns false if some of the Array elements are not empty" do
      expect(["", 1, "", Object.new, :a].all_empty?).to eq false
    end

    it "returns true for an empty Array" do
      expect([].all_empty?).to eq true
    end
  end

  context "#all_same?" do
    it "returns true if all elements are the same" do
      expect(["zero", "zero", "zero"].all_same?).to eq true
    end

    it "returns false if at least one is element is different" do
      expect(["same", "same", "different"].all_same?).to eq false
    end

    it "returns true if it is an empty array" do
      expect([].all_same?).to eq true
    end
  end

  context "#any_empty?" do
    it "returns true if all elements are empty" do
      expect(["", "", ""].any_empty?).to eq true
    end

    it "returns true if at only one element is empty" do
      expect(["something", "thing", "item", ""].any_empty?).to eq true
    end

    it "returns true if it is an empty array" do
      expect([].any_empty?).to eq true
    end

    it "returns false if all elements are not empty" do
      expect(["item", "thing", "something"].any_empty?).to eq false
    end
  end

  context "#none_empty?" do
    it "returns true if all elements are not empty" do
      expect(["stuff", "more stuff", "cool"].none_empty?).to eq true
    end

    it "returns false if its an empty array" do
      expect([].none_empty?).to eq false
    end

    it "returns false if at least one element empty" do
      expect(["stuff", "", "occupied"].none_empty?).to eq false
    end
  end


end
