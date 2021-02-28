require "validator"

RSpec.describe Validator do
  let(:validator) {described_class.new}

  it "asks the user for a card number" do
    expect(validator.greeting).to eq("Enter a card number")
  end

  it "asks the user for a card number" do
    expect(validator.greeting).to eq("Enter a card number")
  end

  context "with a black card" do
    let(:card_number) {"60141016700078611"}
    it "prints the correct colour" do 
      expect(validator.find_colour(card_number)).to eq("Fly Buys Black") 
    end
  end

  context "with a red card" do
    let(:card_number) {"6014352700000140"}
    it "prints the correct colour" do 
      expect(validator.find_colour(card_number)).to eq("Fly Buys Red") 
    end
  end

  context "with a green card" do
    let(:card_number) {"6014355526000020"}
    it "prints the correct colour" do 
      expect(validator.find_colour(card_number)).to eq("Fly Buys Green") 
    end
  end

  context "with a blue card" do
    let(:card_number) {"6014709045001234"}
    it "prints the correct colour" do 
      expect(validator.find_colour(card_number)).to eq("Fly Buys Blue") 
    end
  end

  context "with a valid card format" do
    let(:card_number) {"60141016700078611"}
    it "displays valid status" do 
      expect(validator.validate(card_number)).to eq("valid") 
    end
  end

  context "with an invalid card format" do
    let(:card_number) {"djkslkasdui"}
    it "prints an unknown card type" do 
      expect(validator.find_colour(card_number)).to eq("Unknown") 
    end
    it "prints invalid status" do 
      expect(validator.validate(card_number)).to eq("invalid") 
    end
  end
end
