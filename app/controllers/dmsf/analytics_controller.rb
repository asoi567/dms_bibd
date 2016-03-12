class Dmsf::AnalyticsController < ApplicationController
  before_action :set_dmsf_analytic, only: [:show, :edit, :update, :destroy]

  # GET /dmsf/analytics
  # GET /dmsf/analytics.json
  def index
    @dmsf_analytics = Dmsf::Analytic.all
  end

  # GET /dmsf/analytics/1
  # GET /dmsf/analytics/1.json
  def show
  end

  # GET /dmsf/analytics/new
  def new
    @dmsf_analytic = Dmsf::Analytic.new
  end

  # GET /dmsf/analytics/1/edit
  def edit
  end

  # POST /dmsf/analytics
  # POST /dmsf/analytics.json
  def create
    @dmsf_analytic = Dmsf::Analytic.new(dmsf_analytic_params)

    respond_to do |format|
      if @dmsf_analytic.save
        format.html { redirect_to dmsf_analytics_url, notice: t('.notice') }
        format.json { render :show, status: :created, location: @dmsf_analytic }
      else
        format.html { render :new }
        format.json { render json: @dmsf_analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dmsf/analytics/1
  # PATCH/PUT /dmsf/analytics/1.json
  def update
    respond_to do |format|
      if @dmsf_analytic.update(dmsf_analytic_params)
        format.html { redirect_to dmsf_analytics_url, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @dmsf_analytic }
      else
        format.html { render :edit }
        format.json { render json: @dmsf_analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dmsf/analytics/1
  # DELETE /dmsf/analytics/1.json
  def destroy
    @dmsf_analytic.destroy
    respond_to do |format|
      format.html { redirect_to dmsf_analytics_url, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dmsf_analytic
      @dmsf_analytic = Dmsf::Analytic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dmsf_analytic_params
      params.require(:dmsf_analytic).permit(:name, :analytic_type_id)
    end
end
