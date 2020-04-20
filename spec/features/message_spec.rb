require 'rails_helper'

feature 'message', type: :feature do
  let(:user) { create(:user) }
  let(:mission) { create(:mission) }

  scenario 'post message' do
    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input.logbtn').click
    expect(current_path).to eq root_path
    expect(page).to have_no_content('Send')
    # メッセージの投稿
    expect do
      visit mission_path(mission)
      expect(current_path).to eq mission_path(mission)
      attach_file 'message[image]', "public/images/test_image.png"
      fill_in 'message[content]', with: 'フィーチャスペックのテスト'
      find('input[type="submit"]').click
    end.to change(Message, :count).by(1)
  end
end
