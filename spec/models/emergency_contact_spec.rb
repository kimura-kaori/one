require 'rails_helper'
RSpec.describe Student, type: :model do
  before do
    @user = FactoryBot.create(:user1)
    @user.skip_confirmation!
    @user.save!
    @student = FactoryBot.create(:student)
    @emergency_contact = FactoryBot.create(:emergency_contact1)
  end
  describe '緊急連絡先登録' do
    context '全項目に入力した場合' do
      it '登録に成功する' do
        expect(@emergency_contact).to be_valid
      end
    end
    context '未入力の項目があった場合' do
      it 'バリデーションにより登録できない' do
        emergency_contact = EmergencyContact.new(name: nil, relationship: nil, contact_address: nil, telephone: nil, student: @student)
        expect(emergency_contact).not_to be_valid
      end
    end
  end
end
