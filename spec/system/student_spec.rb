require 'rails_helper'

RSpec.describe '生徒登録機能', type: :system do

  describe '新規登録機能' do
    context '生徒を新規登録した場合' do
      it '管理者と一般ユーザーにメールが送信される' do
        visit new_user_student_path
        fill_in "", with: ""
        fill_in "task[content]", with: "自動化"
        fill_in "task[deadline]", with: "2022-02-01"
        select '低', from: 'task_priority'
        select 'yet', from: 'task_status'
        click_on "Create Task"
        expect(page).to have_content 'メーカー直送'
      end
    end
  end
end
