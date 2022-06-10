class ReportMailer < ApplicationMailer
  def send_message_to_school(user)
    @user = user
    mail to: @user.email, subject: "生徒情報を登録しました。"
  end
end
