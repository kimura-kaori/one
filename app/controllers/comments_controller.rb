class CommentsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    # @student = Student.find(params[:id])
    @contact = Contact.find(params[:contact_id])
    @comment = @contact.comments.build(comment_params)
    # contact_room_url = "http://localhost:3000/users/#{current_user.id}/contacts/#{Contact.find_by(user_id: current_user.id).id}"
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }
        #ここでメール送信のメソッドを呼ぶ？
        # ReportMailer.send_message_to_school(contact_room_url, @current_user, @student).deliver
        # ReportMailer.welcome_email(contact_room_url, @current_user, @student).deliver
        # redirect_to user_path(current_user), notice: "お手続きありがとうございました。通知が完了しました。"
      else
        format.html { redirect_to user_contact_path(@contact), notice: '投稿できませんでした...' }
      end
    end
  end

  private

  def comment_params
    # params.require(:comment).permit(:content).merge(user_id: current_user.id, student_id: student.id)
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
