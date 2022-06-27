require 'rails_helper'
RSpec.describe '生徒情報管理機能', type: :system do
before do
  @user = FactoryBot.create(:user1)
  @user.skip_confirmation!
  @user.save!
  @student = FactoryBot.create(:student)
end

  context '新規生徒登録をした場合' do
    it '登録した生徒の詳細ページが表示される' do
      visit new_user_session_path
      fill_in 'user_email', with: 'normal1@normal.com'
      fill_in 'user_password', with: '111111'
      find('#session_new').click
      visit new_user_student_path(user_id: @user.id)
      fill_in 'formGroup1', with: 'やまだたろう'
      fill_in 'formGroup2', with: '山田太郎'
      fill_in 'formGroup3', with: '男'
      select '2011', from: 'student_birthday_1i'
      select '11', from: 'student_birthday_2i'
      select '23', from: 'student_birthday_3i'
      fill_in 'formGroup5', with: '077-1234-5678'
      fill_in 'formGroup6', with: '090-1234-5678'
      fill_in 'formGroup7', with: '600-0000'
      fill_in 'formGroup8', with: '京都府京都市中京区烏丸御池123'
      fill_in 'formGroup9', with: 'やまだきょうこ'
      fill_in 'formGroup10', with: '山田京子'
      fill_in 'formGroup11', with: '母'
      click_on '登録する'
      expect(page).to have_content '基本情報'
    end
  end

  context '編集をした場合' do
    it '更新した生徒の詳細ページが表示される' do
      visit new_user_session_path
      fill_in 'user_email', with: 'normal1@normal.com'
      fill_in 'user_password', with: '111111'
      find('#session_new').click
      visit edit_user_student_path(@user, @student)
      fill_in 'formGroup1', with: 'テスト'
      click_on '更新する'
      expect(page).to have_content '基本情報'
    end
  end

  context '他人の生徒ページにアクセスした場合' do
    let(:user2) { FactoryBot.create(:user2) }
    let(:student2) { FactoryBot.create(:student2) }
    it 'トップページに遷移する' do
      visit new_user_session_path
      fill_in 'user_email', with: 'normal1@normal.com'
      fill_in 'user_password', with: '111111'
      find('#session_new').click
      visit user_student_path(user2.id, student2.id)
      expect(page).to have_content 'top'
    end
  end
end
