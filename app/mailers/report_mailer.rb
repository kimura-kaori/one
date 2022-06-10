class ReportMailer < ApplicationMailer
  # def send_message_to_school
  #   mail to: ENV["SCHOOL"],subject: "生徒情報を登録しました。"
  # end
  def send_message_to_school(student)
    @student = student
    mail to: ENV["SCHOOL"],subject: "生徒情報を登録しました。"
  end
end
