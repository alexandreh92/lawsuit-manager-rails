class Dashboard::DummiesController < ApplicationController
  before_action :set_dashboard_dummy, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/dummies
  # GET /dashboard/dummies.json
  def index
    @dashboard_dummies = Dashboard::Dummy.all
  end

  # GET /dashboard/dummies/1
  # GET /dashboard/dummies/1.json
  def show
  end

  # GET /dashboard/dummies/new
  def new
    @dashboard_dummy = Dashboard::Dummy.new
  end

  # GET /dashboard/dummies/1/edit
  def edit
  end

  # POST /dashboard/dummies
  # POST /dashboard/dummies.json
  def create
    @dashboard_dummy = Dashboard::Dummy.new(dashboard_dummy_params)

    respond_to do |format|
      if @dashboard_dummy.save
        format.html { redirect_to @dashboard_dummy, notice: 'Dummy was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard_dummy }
      else
        format.html { render :new }
        format.json { render json: @dashboard_dummy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/dummies/1
  # PATCH/PUT /dashboard/dummies/1.json
  def update
    respond_to do |format|
      if @dashboard_dummy.update(dashboard_dummy_params)
        format.html { redirect_to @dashboard_dummy, notice: 'Dummy was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard_dummy }
      else
        format.html { render :edit }
        format.json { render json: @dashboard_dummy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/dummies/1
  # DELETE /dashboard/dummies/1.json
  def destroy
    @dashboard_dummy.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_dummies_url, notice: 'Dummy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard_dummy
      @dashboard_dummy = Dashboard::Dummy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_dummy_params
      params.require(:dashboard_dummy).permit(:name)
    end
end
