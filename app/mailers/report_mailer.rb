class ReportMailer < ApplicationMailer
  # def send_message_to_school
  #   mail to: ENV["SCHOOL"],subject: "生徒情報を登録しました。"
  # end
  def send_message_to_school(student)
    @send_emails << student.user.email
    @send_emails << ENV["SCHOOL"]
    @send_emails.each do |send_mail|
      mail to: send_emails ,subject: "生徒情報を登録しました。"
    end
  end

  def send_message_to_kejiban(student)
    @send_emails << student.user.email
    @send_emails << ENV["SCHOOL"]
    @send_emails.each do |send_mail|
      mail to: send_emails ,subject: "生徒情報を登録しました。"
    end
  end

end
