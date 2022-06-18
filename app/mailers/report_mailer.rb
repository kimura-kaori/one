class ReportMailer < ApplicationMailer
  def send_message_to_school(contact_room_url, user, student)
    @contact_room_url = contact_room_url
    @user = user
    @student = student
    mail to: ENV["SCHOOL"],subject: "新規登録を受け付けました【One】"
  end

  def welcome_email(contact_room_url, user, student)
    @contact_room_url = contact_room_url
    @user = user
    @student = student
    mail to: @user.email, subject: '（京都東中学校）ご登録ありがとうございました。【One】'
  end
end
