require "rails_helper"

RSpec.describe Emoji, type: :model do
  describe "validations" do
    it { should validate_presence_of :emoji_image }
    it "is valid with valid attributes" do
      expect(Emoji.new(emoji_image: "😆")).to be_valid
    end
    it "is not valid without a title" do
      auction = Emoji.new(emoji_image: nil)
      expect(auction).to_not be_valid
    end
  end
end
