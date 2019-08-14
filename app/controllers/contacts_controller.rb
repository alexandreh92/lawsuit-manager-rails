# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]
  before_action :set_options_for_select, only: %i[new edit update create]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
    respond_to do |format|
      format.html
      format.json { render json: ContactDatatable.new(params) }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show; end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.phones.build
    
  end

  # GET /contacts/1/edit
  def edit; end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render @contact }
      else
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

  def set_options_for_select
    @profession_options_for_select = Profession.all.collect { |c| [c.description, c.id] }
    @marital_options_for_select = MaritalStatus.all.collect { |m| [m.description, m.id] }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:name, :lastname, :cpf, :rg, :birthdate, :profession_id, :marital_status_id, :address,
                                    :zipcode, :city, :state, :district, :number, :actives[])
  end
end
