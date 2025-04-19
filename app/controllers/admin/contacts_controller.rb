class Admin::ContactsController < ApplicationController
   layout 'admin'
  def index
    @contacts = Contact.order(created_at: :desc)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to admin_contacts_path, notice: 'お問い合わせを削除しました'
  end

end
