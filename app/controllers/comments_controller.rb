class CommentsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:contact_id])
    @comment = @contact.comments.build(comment_params)
    @contact_room_url = "http://localhost:3000/users/#{current_user.id}/contacts/#{Contact.find_by(user_id: current_user.id).id}"
    respond_to do |format|
      if @comment.save
        format.js { render :index }
        ReportMailer.notice_comment(current_user).deliver
        ReportMailer.alert_comment(current_user).deliver
      else
        format.html { redirect_to user_contact_path(@contact), notice: '投稿できませんでした...' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
