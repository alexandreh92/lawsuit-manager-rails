# frozen_string_literal: true

class LawsuitsController < ApplicationController
  before_action :set_lawsuit, only: %i[show edit update destroy]
  before_action :set_options_for_select

  # GET /lawsuits
  # GET /lawsuits.json
  def index
    @lawsuits = Lawsuit.all
    respond_to do |format|
      format.html
      format.json { render json: LawsuitDatatable.new(params) }
    end
  end

  # GET /lawsuits/1
  # GET /lawsuits/1.json
  def show; end

  # GET /lawsuits/new
  def new
    @lawsuit = Lawsuit.new
    @lawsuit.actives.build
  end

  # GET /lawsuits/1/edit
  def edit; end

  # POST /lawsuits
  # POST /lawsuits.json
  def create  
    
    @lawsuit = Lawsuit.new(lawsuit_params)
  
    lawsuit_params[:actives_attributes]["0"].each do |k,w|
      puts "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF #{w}"
    end


    respond_to do |format|
      if @lawsuit.save
        format.html { redirect_to @lawsuit, notice: 'Lawsuit was successfully created.' }
        format.json { render :show, status: :created, location: @lawsuit }
      else
        format.html { render :new }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lawsuits/1
  # PATCH/PUT /lawsuits/1.json
  def update
    respond_to do |format|
      if @lawsuit.update(lawsuit_params)
        format.html { redirect_to @lawsuit, notice: 'Lawsuit was successfully updated.' }
        format.json { render :show, status: :ok, location: @lawsuit }
      else
        format.html { render :edit }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lawsuits/1
  # DELETE /lawsuits/1.json
  def destroy
    @lawsuit.destroy
    respond_to do |format|
      format.html { redirect_to lawsuits_url, notice: 'Lawsuit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_options_for_select
    @lawyer_options_for_select = Lawyer.all.collect { |l| [l.name, l.id] }
    @forum_options_for_select = Forum.all.collect { |f| [f.name, f.id] }
    @actives_options_for_select = Contact.all.pluck(:name, :id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lawsuit
    @lawsuit = Lawsuit.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lawsuit_params
    params.require(:lawsuit).permit(:forum_id, :lawyer_id, :fees, :autos, :conciliation_date,
                                    :instruction_date, actives_attributes: [:contact_id => []])
  end
end