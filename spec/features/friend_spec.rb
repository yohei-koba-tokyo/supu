require 'rails_helper'

feature 'friend', type: :feature do
  let(:user) { create(:user) }

  scenario 'post friend' do
    # ログイン前にはSendボタンがない
    visit root_path
    expect(page).to have_no_content('Send')
    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input.logbtn').click
    expect(current_path).to eq root_path
    # フレンド一覧ページに移動
    click_link('フレンド一覧', match: :first)
    expect(current_path).to eq friends_path
    click_link('追加')
    expect(current_path).to eq new_friend_path
    # フレンドの登録
    expect do
      fill_in "friend[name]", with: "Ted"
      fill_in 'friend[birth]', with: "1982-10-20"
      select "男性", from: 'friend[sex]'
      fill_in 'friend[twitter]', with: "legrobeats"
      fill_in 'friend[memo]', with: "memomemomemo."
      find('input[type="submit"]').click
    end.to change(Friend, :count).by(1)
  end
end
