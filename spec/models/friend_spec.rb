require 'rails_helper'
describe Friend do
  describe '#create' do
    it "is invalid without a name" do
      friend = build(:friend, name: "")
      friend.valid?
      expect(friend.errors[:name]).to include("を入力してください")
    end
    it "is invalid with a name that has more than 8 characters " do
      friend = build(:friend, name: "aaaaaaaa")
      friend.valid?
      expect(friend.errors[:name]).to include("は7文字以内で入力してください")
    end
    it "is valid with a name that has less than 7 characters " do
      friend = build(:friend, name: "aaaaaaa")
      expect(friend).to be_valid
    end    
    it "is valid without a twitter" do
      friend = build(:friend, twitter: "")
      expect(friend).to be_valid
    end
    it "is valid without a memo" do
      friend = build(:friend, memo: "")
      expect(friend).to be_valid
    end
    it "is valid without a birth" do
      friend = build(:friend, birth: "")
      expect(friend).to be_valid
    end
    it "is valid without a sex" do
      friend = build(:friend, sex: "")
      expect(friend).to be_valid
    end
    it "is valid with completed form" do
      friend = build(:friend)
      expect(friend).to be_valid
    end
  end
end