require 'rails_helper'
describe Friend do
  describe '#create' do

    it "is valid with all form" do
      friend = build(:friend)
      expect(friend).to be_valid
    end

  end
end