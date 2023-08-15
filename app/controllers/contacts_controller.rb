class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if user_signed_in?
      @contacts = current_user.contacts
    else
      flash.now[:notice] = "You have not asked any question"
    end
  end
  def new
    @contact = Contact.new
  end
  def create

    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private
  def contact_params
    params.require(:contact).permit(:question)
  end
end
