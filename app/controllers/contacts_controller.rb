class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    if @contact.valid?
      render 'confirm'
    else
      render 'index'
    end
  end

  def thanks
    # メール送信
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    ContactMailer.received_email(@contact).deliver
    # 完了画面表示
    render 'thanks'
  end
end
