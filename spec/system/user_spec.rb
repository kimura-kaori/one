require 'rails_helper'
RSpec.describe 'ユーザー登録・ログイン・ログアウト機能', type: :system do

  context 'ユーザーを新規登録した場合' do
    it '本人確認用のメールが送信される' do
      visit root_path
      click_on 'アカウント登録'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: '111111'
      fill_in 'user_password_confirmation', with: '111111'
      find('.user_new').click
      expect(page).to have_content '本人確認用のメールを送信しました。'
    end
  end

  before do
    @user = FactoryBot.create(:admin_user)
    @user.skip_confirmation!
    @user.save!
  end

  context 'ログインに成功した場合' do
    it 'マイページが表示される' do
      visit new_user_session_path
      fill_in 'user_email', with: 'admin@admin.com'
      fill_in 'user_password', with: '111111'
      find('#session_new').click
      expect(page).to have_content 'ログインしました。'
    end
  end

  context 'ログインに失敗した場合' do
    it 'エラーメッセージが表示される' do
      visit new_user_session_path
      fill_in 'user_email', with: 'aa@admin.com'
      fill_in 'user_password', with: '111111'
      find('#session_new').click
      expect(page).to have_content 'Eメールまたはパスワードが違います。'
    end
  end

  context '管理者としてログインした場合' do
    it '管理画面にアクセスできる' do
      visit new_user_session_path
      fill_in 'user_email', with: 'admin@admin.com'
      fill_in 'user_password', with: '111111'
      find('#session_new').click
      visit rails_admin_path
      expect(page).to have_content 'サイト管理'
    end
  end
end
