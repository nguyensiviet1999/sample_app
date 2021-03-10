require "rails_helper"

RSpec.describe Comment, type: :model do
  subject {
    described_class.new(user_id: User.first.id,
                        content: "Anything",
                        micropost_id: Micropost.first.id)
  }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:content) }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a micropost_id" do
    subject.micropost_id = nil
    expect(subject).to_not be_valid
  end
  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:micropost).without_validating_presence }
    it { should belong_to(:parent_comment).without_validating_presence }
    it { should have_many(:children_comments) }
    it { should have_many(:reaction_comments) }
    it { should have_many(:emojis) }
  end
end
