class ContactsController < ApplicationController

  def show
    @contact = Contact.find(params[:id])
    @comments = @contact.comments
    @comment = @contact.comments.build
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.build(title: "コメントルーム")

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_url(@contact), notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
end
