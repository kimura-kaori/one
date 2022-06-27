require 'rails_helper'
RSpec.describe '家庭環境調査管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user1)
    @user.skip_confirmation!
    @user.save!
    @student = FactoryBot.create(:student)
    @emergency_contact = FactoryBot.create(:emergency_contact1)
  end

  context '新規登録をした場合' do
    it '登録した緊急連絡先の詳細ページが表示される' do
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
      visit new_user_student_emergency_contact_path(student_id: @student, user_id: @user)
      fill_in 'formGroup1', with: '山田京子'
      fill_in 'formGroup2', with: '母'
      fill_in 'formGroup3', with: 'DIC株式会社'
      fill_in 'formGroup4', with: '090-0000-0000'
      click_on '登録する'
      expect(page).to have_content '緊急連絡先'
    end
  end
  #
  context '編集をした場合' do
    it '更新した緊急連絡先の詳細ページが表示される' do
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
      visit edit_user_student_emergency_contact_path(@emergency_contact, student_id: @student, user_id: @user)
      fill_in 'formGroup4', with: '090-0000-1234'
      click_on '更新する'
      expect(page).to have_content '緊急連絡先情報を更新しました。'
    end
  end

  context '他人の緊急連絡先一覧にアクセスした場合' do
    let(:user2) { FactoryBot.create(:user2) }
    let(:student2) { FactoryBot.create(:student2) }
    let(:emergency_contact2) { FactoryBot.create(:emergency_contact2) }
    it 'トップページに遷移する' do
      visit new_user_session_path
      fill_in 'user_email', with: 'normal1@normal.com'
      fill_in 'user_password', with: '111111'
      find('#session_new').click
      visit user_student_emergency_contacts_path(student_id: @student, user_id: @user)
      expect(page).to have_content 'top'
    end
  end

  context '他人の緊急連絡先編集画面にアクセスした場合' do
    let(:user2) { FactoryBot.create(:user2) }
    let(:student2) { FactoryBot.create(:student2) }
    let(:emergency_contact2) { FactoryBot.create(:emergency_contact2) }
    it 'トップページに遷移する' do
      visit new_user_session_path
      fill_in 'user_email', with: 'normal1@normal.com'
      fill_in 'user_password', with: '111111'
      find('#session_new').click
      visit edit_user_student_emergency_contact_path(@emergency_contact, student_id: @student, user_id: @user)
      expect(page).to have_content 'top'
    end
  end
end
