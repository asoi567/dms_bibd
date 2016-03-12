class Dmsf::AnalyticTypesController < ApplicationController
  before_action :set_dmsf_analytic_type, only: [:show, :edit, :update, :destroy]

  # GET /dmsf/analytic_types
  # GET /dmsf/analytic_types.json
  def index
    @dmsf_analytic_types = Dmsf::AnalyticType.all
  end

  # GET /dmsf/analytic_types/1
  # GET /dmsf/analytic_types/1.json
  def show
  end

  # GET /dmsf/analytic_types/new
  def new
    @dmsf_analytic_type = Dmsf::AnalyticType.new
  end

  # GET /dmsf/analytic_types/1/edit
  def edit
  end

  # POST /dmsf/analytic_types
  # POST /dmsf/analytic_types.json
  def create
    @dmsf_analytic_type = Dmsf::AnalyticType.new(dmsf_analytic_type_params)

    respond_to do |format|
      if @dmsf_analytic_type.save
        format.html { redirect_to dmsf_analytic_types_url, notice: t('.notice') }
        format.json { render :show, status: :created, location: @dmsf_analytic_type }
      else
        format.html { render :new }
        format.json { render json: @dmsf_analytic_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dmsf/analytic_types/1
  # PATCH/PUT /dmsf/analytic_types/1.json
  def update
    respond_to do |format|
      if @dmsf_analytic_type.update(dmsf_analytic_type_params)
        format.html { redirect_to dmsf_analytic_types_url, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @dmsf_analytic_type }
      else
        format.html { render :edit }
        format.json { render json: @dmsf_analytic_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dmsf/analytic_types/1
  # DELETE /dmsf/analytic_types/1.json
  def destroy
    @dmsf_analytic_type.destroy
    respond_to do |format|
      format.html { redirect_to dmsf_analytic_types_url, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dmsf_analytic_type
      @dmsf_analytic_type = Dmsf::AnalyticType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dmsf_analytic_type_params
      params.require(:dmsf_analytic_type).permit(:name)
    end
end
