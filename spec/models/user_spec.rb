require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "is invalid without a email" do
      user = User.new(nickname: "peace", email: "", password: "abcdefg", password_confirmation: "abcdefg")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "is invalid without a password" do
      user = User.new(nickname: "peace", email: "love@gmail.com", password: "", password_confirmation: "abcdefg")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end
end