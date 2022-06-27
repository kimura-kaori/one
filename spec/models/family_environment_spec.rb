require 'rails_helper'
RSpec.describe Student, type: :model do
  before do
    @user = FactoryBot.create(:user1)
    @user.skip_confirmation!
    @user.save!
    @student = FactoryBot.create(:student)
    @family_environment = FactoryBot.create(:family_environment1)
  end
  describe '家庭環境調査登録' do
    context '全項目に入力した場合' do
      it '登録に成功する' do
        expect(@family_environment).to be_valid
      end
    end
    context '未入力の項目があった場合' do
      it 'バリデーションにより登録できない' do
        family_environment = FamilyEnvironment.new(relationship: nil, name: nil, birthday: nil, age: nil, family: nil, student: @student)
        expect(family_environment).not_to be_valid
      end
    end
  end
end
