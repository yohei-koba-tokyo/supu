require 'rails_helper'
describe Mission do
  describe '#create' do

  context "can save" do
    it "is valid with a name that has less than 15 characters " do
      friend = create(:friend)
      mission = build(:mission, name: "aaaaabbbbbccccc", friend_id: friend.id)
      expect(mission).to be_valid
    end
    it "is valid without a comment" do
      friend = create(:friend)
      mission = build(:mission, comment: "", friend_id: friend.id)
      expect(mission).to be_valid
    end
    it "is valid without a mission_type" do
      friend = create(:friend)
      mission = build(:mission, mission_type: "", friend_id: friend.id)
      expect(mission).to be_valid
    end
    it "is valid with completed form" do
      friend = create(:friend)
      mission = build(:mission, friend_id: friend.id)
      expect(mission).to be_valid
    end
  end
  context "can not save" do
    it "is invalid without a name" do
      mission = build(:mission, name: "")
      mission.valid?
      expect(mission.errors[:name]).to include("を入力してください")
    end
    it "is invalid with a name that has more than 16 characters " do
      mission = build(:mission, name: "aaaaabbbbbcccccd")
      mission.valid?
      expect(mission.errors[:name]).to include("は15文字以内で入力してください")
    end

    it "is invalid without a datetime" do
      mission = build(:mission, datetime: "")
      mission.valid?
      expect(mission.errors[:datetime]).to include("を入力してください")
    end

    it "is invalid without a friend_id" do
      mission = build(:mission)
      mission.valid?
      expect(mission.errors[:friend_id]).to include("を入力してください")
    end
  end
  end
end