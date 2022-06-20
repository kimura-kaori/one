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

  def notice_comment(user, url) #学校宛
    # @url = Rails.application.routes.url_helpers.root_url
    @url = url
    @user = user
    mail to: ENV["SCHOOL"], subject: '連絡欄へ投稿がありました。【One】'
  end

  def alert_comment(user, url)#保護者宛
    @user = user
    @url = url
    mail to: @user.email, subject: '（京都東中学校）連絡欄へ投稿がありました。【One】'
  end
end
