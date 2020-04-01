require 'rails_helper'
describe Mission do
  describe '#create' do
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
    it "is valid with a name that has less than 15 characters " do
      mission = build(:mission, name: "aaaaabbbbbccccc")
      expect(mission).to be_valid
    end    


    # it "is valid without a twitter" do
    #   mission = build(:mission, twitter: "")
    #   expect(mission).to be_valid
    # end
    # it "is valid without a memo" do
    #   mission = build(:mission, memo: "")
    #   expect(mission).to be_valid
    # end
    # it "is valid without a birth" do
    #   mission = build(:mission, birth: "")
    #   expect(mission).to be_valid
    # end
    # it "is valid without a sex" do
    #   mission = build(:mission, sex: "")
    #   expect(mission).to be_valid
    # end
    # it "is valid with completed form" do
    #   mission = build(:mission)
    #   expect(mission).to be_valid
    # end
  end
end