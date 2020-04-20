require 'rails_helper'

feature 'mission', type: :feature do
  let(:user) { create(:user) }
  let(:friend) { create(:friend, user_id: user.id) }

  scenario 'post mission' do
    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input.logbtn').click
    expect(current_path).to eq root_path
    # フレンド一覧ページに移動
    click_link('フレンド一覧', match: :first)
    expect(current_path).to eq friends_path
    # フレンド詳細画面に移動
    visit friend_path(friend)
    expect(current_path).to eq friend_path(friend)
    # ミッション作成画面に移動
    click_link('ミッション作成')
    expect(current_path).to eq new_mission_path
    # ミッションの登録
    expect do
      fill_in "mission[name]", with: "誕生日会"
      fill_in 'mission[datetime]', with: "2029-10-20"
      select "友達", from: 'mission[mission_type]'
      fill_in 'mission[comment]', with: "祝いましょう！"
      find('input.logbtn-new').click
    end.to change(Mission, :count).by(1)
  end
end
