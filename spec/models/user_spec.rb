require 'rails_helper'
describe User do
  describe '#create' do
    context "can save" do
      it "is valid with a nickname that has less than 7 characters " do
        user = build(:user, nickname: "aaaaaaa")
        expect(user).to be_valid
      end
      it "is valid with a password that has more than 6 characters " do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user).to be_valid
      end
      it "is valid with a nickname, email, password, password_confirmation" do
        user = build(:user)
        expect(user).to be_valid
      end
    end
    context "can not save" do
      it "is invalid without a nickname" do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end
      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
      it "is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
      it "is invalid passwords doesn't match" do
        user = build(:user, password_confirmation: "wrongpass")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
      end
      it "is invalid with a nickname that has more than 8 characters " do
        user = build(:user, nickname: "aaaaaaaa")
        user.valid?
        expect(user.errors[:nickname]).to include("は7文字以内で入力してください")
      end
      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end
      it "is invalid with a password that has less than 5 characters " do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end
    end
  end
end