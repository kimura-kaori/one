require 'rails_helper'
RSpec.describe Student, type: :model do
  before do
    @user = FactoryBot.create(:user1)
    @user.skip_confirmation!
    @user.save!
    @student = FactoryBot.create(:student)
  end
  describe '新規生徒登録' do
    context '全項目に入力した場合' do
      it '生徒登録に成功する' do
        expect(@student).to be_valid
      end
    end
    context '自宅電話番号以外に未入力の項目があった場合' do
      it 'バリデーションにより登録できない' do
        student = Student.new(student_furigana: nil, student_name: nil, sex: nil, birthday: nil, telephone: nil, cellphone: nil, post_code: nil, address:nil, parents_furigana: nil, parents_name: nil, relationship: nil, user: @user)
        expect(student).not_to be_valid
      end
    end
  end
end
