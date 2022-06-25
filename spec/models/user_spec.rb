require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規ユーザー登録' do
    context 'email,passwordを正く入力した場合' do
      it 'ユーザー登録に成功する' do
        user = FactoryBot.create(:user1)
        expect(user).to be_valid
      end
    end

    context 'emailが未入力の場合' do
      it 'バリデーションにより登録できない' do
        user = User.new(email: '', password: '111111', password_confirmation: '111111')
        expect(user).not_to be_valid
      end
    end

    context 'emailのフォーマットが正しくない場合' do
      it 'バリデーションにより登録できない' do
        user = User.new(email: 'aa', password: '111111', password_confirmation: '111111')
        expect(user).not_to be_valid
      end
    end

    context 'passwordが未入力の場合' do
      it 'バリデーションにより登録ができない' do
        user = User.new(email: 'normal1@normal.com', password: '', password_confirmation: '')
        expect(user).not_to be_valid
      end
    end

    context 'passwordが6文字未満の場合' do
      it 'バリデーションにより登録ができない' do
        user = User.new(email: 'normal1@normal.com', password: '1', password_confirmation: '1')
        expect(user).not_to be_valid
      end
    end
  end
end
