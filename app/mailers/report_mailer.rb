class ReportMailer < ApplicationMailer
  def send_message_to_school(contact_room_url)
    @contact_room_url = contact_room_url
    mail to: ENV["SCHOOL"],subject: "コメント投稿がありました。【One】"
  end

  def welcome_email(user, contact_room_url)
    @user = user
    @contact_room_url = contact_room_url
    mail to: @user.email, subject: '（京都東中学校）コメント投稿がありました。【One】'
  end
end
