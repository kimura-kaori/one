require 'rails_helper'
RSpec.describe 'ユーザー登録・ログイン・ログアウト機能', type: :system do

  # アカウント作成⇨アカウント登録クリック⇨トップページに戻り「本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。」の表示。
  # メールのURLクリック⇨メールアドレスの確認⇨ログイン画面に遷移⇨ログイン情報入力⇨ログイン成功、マイページへ。

#   context 'ユーザーを新規登録した場合' do
#     it 'が表示される' do
#       visit root_path
#       click_on 'アカウント登録'
#       fill_in 'user_email', with: 'test@test.com'
#       fill_in 'user_password', with: '111111'
#       fill_in 'user_password_confirmation', with: '111111'
#       find('.user_new').click
#       expect(page).to have_content '本人確認用のメールを送信しました。'
#     end
#   end
# end
  let!(:user1) { FactoryBot.create(:user1) }
  # before do
  #   FactoryBot.create(:user1, email: 'normal1@normal.com', password: '111111')
  # end
  context 'ログイン画面に遷移した場合' do
    it 'ログインができる' do
      visit new_user_session_path
      fill_in 'user_email', with: 'normal1@normal.com'
      fill_in 'user_password', with: '111111'
      fill_in 'user_password_confirmation', with: '111111'
      find('.session_new').click
      expect(page).to have_content 'ログインしました。'
    end
  end
end

# feature 'Sign up' do
#   background do
#     ActionMailer::Base.deliveries.clear
#   end
#
#   def extract_confirmation_url(mail)
#     body = mail.body.encoded
#     body[/http[^"]+/]
#   end
#
# RSpec.describe 'ユーザー登録・ログイン・ログアウト機能', type: :system do
#   # before do
#   #   @user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
#   # end
#     context 'ユーザーを新規登録した場合' do
#       it 'トップページが表示される' do
#         visit root_path
#         expect(page).to have_http_status :ok
#       end
#     end

#
