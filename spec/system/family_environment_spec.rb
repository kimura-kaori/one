require 'rails_helper'
RSpec.describe '家庭環境調査管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user1)
    @user.skip_confirmation!
    @user.save!
    @student = FactoryBot.create(:student)
    @family_environment = FactoryBot.create(:family_environment)
  end

  context '新規登録をした場合' do
    it '登録した家族の詳細ページが表示される' do
      visit new_user_session_path
      fill_in 'user_email', with: 'normal1@normal.com'
      fill_in 'user_password', with: '111111'
      find('#session_new').click
      visit new_user_student_path(@user)
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
      visit new_user_student_family_environment_path(student_id: @student, user_id: @user)
      fill_in 'formGroup1', with: '母'
      fill_in 'formGroup2', with: '山田京子'
      select '1980', from: 'family_environment_birthday_1i'
      select '10', from: 'family_environment_birthday_2i'
      select '18', from: 'family_environment_birthday_3i'
      select '41', from: 'family_environment_age'
      fill_in 'formGroup3', with: '会社員'
      click_on '登録する'
      expect(page).to have_content '家庭環境調査'
    end
  end

  context '編集をした場合' do
    it '更新した家庭環境調査の詳細ページが表示される' do
      visit new_user_session_path
      fill_in 'user_email', with: 'normal1@normal.com'
      fill_in 'user_password', with: '111111'
      find('#session_new').click
      visit new_user_student_path(@user)
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
      visit edit_user_student_family_environment_path(@family_environment, student_id: @student, user_id: @user)
      fill_in 'formGroup1', with: '父'
      click_on '更新する'
      expect(page).to have_content '家庭環境調査を更新しました。'
    end
  end
end
