class Admin::ContactsController < ApplicationController
   layout 'admin'
  def index
    @contacts = Contact.order(created_at: :desc)
    @unread_contacts = Contact.where(is_read: false)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def mark_read
    @contact = Contact.find(params[:id])
    @contact.update(is_read: true)
    redirect_to admin_contact_path(@contact), notice: '既読にしました'
  end

  def mark_unread
    @contact = Contact.find(params[:id])
    @contact.update(is_read: false)
    redirect_to admin_contact_path(@contact), notice: '未読に戻しました'
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to admin_contacts_path, notice: 'お問い合わせを削除しました'
  end

end
