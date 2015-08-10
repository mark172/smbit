class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    if current_user
     @contacts = Contact.all
    else
      redirect_to new_contact_path
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        first_name = params[:contact][:first_name]
        last_name = params[:contact][:last_name]
        business_name = params[:contact][:business_name]
        email = params[:contact][:email]
        phone = params[:contact][:phone]
        question1 = params[:contact][:question1]
        question2 = params[:contact][:question2]
        
        ContactMailer.contact_email(first_name, last_name, business_name, email, phone, question1, question2).deliver
        
        flash[:success] = "Your message has been sent"
        format.html { redirect_to new_contact_path }
        format.json { render :show, status: :created, location: @contact }
      else
        flash[:danger] = "Please fix the errors below"
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :business_name, :email, :phone, :question1, :question2)
    end
end
