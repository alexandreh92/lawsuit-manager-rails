# frozen_string_literal: true

class Dashboard::LawsuitsController < DashboardController
  before_action :set_lawsuit, only: %i[show edit update destroy]
  before_action :set_options_for_select

  # GET /lawsuits
  # GET /lawsuits.json
  def index
    @lawsuits = Dashboard::Lawsuit.all
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
    @lawsuit = Dashboard::Lawsuit.new
    @lawsuit.actives.build
  end

  # GET /lawsuits/1/edit
  def edit
  end

  # POST /lawsuits
  # POST /lawsuits.json
  def create
    @lawsuit = Dashboard::Lawsuit.new(lawsuit_params)

    respond_to do |format|
      if @lawsuit.save
        handle_actives
        handle_recievers
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
    @lawsuit.recievers.clear
    respond_to do |format|
      if @lawsuit.update(lawsuit_params)
        @lawsuit.actives.clear
        handle_edit_actives
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
    @lawyer_options_for_select = Dashboard::Lawyer.all.collect { |l| [l.name, l.id] }
    @forum_options_for_select = Dashboard::Forum.all.collect { |f| [f.name, f.id] }
    @actives_options_for_select = Dashboard::Contact.all
  end

  def active_ids
    params[:lawsuit][:active_ids]
  end

  def active_ids_for_edit
    params[:lawsuit][:actives_attributes]
  end

  def handle_actives
    # use this to nested attributes (fields_for)
    # params[:lawsuit][:actives_attributes].try(:[], '0').try(:[], :contact_id)
    params[:dashboard_lawsuit][:active_ids]&.each do |a|
      @lawsuit.actives << Dashboard::Active.new(contact_id: a, lawsuit_id: @lawsuit[:id])
    end
  end

  def handle_edit_actives
    active_ids_for_edit&.each do |_k, v|
      if v[:contact_id] != "" and v[:_destroy] == "false"
        @lawsuit.actives << Dashboard::Active.new(contact_id: v[:contact_id], lawsuit_id: @lawsuit[:id])
      end
    end
  end

  def handle_recievers
    params[:dashboard_lawsuit][:reciever_ids]&.each do |a|
      @lawsuit.recievers << Dashboard::Reciever.new(contact_id: a, lawsuit_id: @lawsuit[:id])
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lawsuit
    @lawsuit = Dashboard::Lawsuit.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lawsuit_params
    params.require(:dashboard_lawsuit).permit(:forum_id, :lawyer_id, :fees, :autos, :conciliation_date,
                                    :instruction_date, :interrogation_date, recievers_attributes:[:contact_id, :_destroy])
  end
end
