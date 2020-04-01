require 'rails_helper'
describe Message do
  describe '#create' do
    context "can save" do
      it "is valid with completed form" do
        message = build(:message)
        expect(message).to be_valid
      end
      it "is valid only content" do
        message = build(:message, image: "")
        expect(message).to be_valid
      end

      it "is valid only image" do
        message = build(:message, content: "")
        expect(message).to be_valid
      end
    end
    context "can not save" do
      it "is invalid without content and image" do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end

      it 'is invalid without mission_id' do
        message = build(:message, mission_id: nil)
        message.valid?
        expect(message.errors[:mission]).to include("を入力してください")
      end

      it 'is invaid without user_id' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end