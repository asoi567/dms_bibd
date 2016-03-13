class Dmsf::StandardOperationsController < ApplicationController
  before_action :set_dmsf_standard_operation, only: [:show, :edit, :update, :destroy]

  # GET /dmsf/standard_operations
  # GET /dmsf/standard_operations.json
  def index
    @dmsf_standard_operations = Dmsf::StandardOperation.all
  end

  # GET /dmsf/standard_operations/1
  # GET /dmsf/standard_operations/1.json
  def show
  end

  # GET /dmsf/standard_operations/new
  def new
    @dmsf_standard_operation = Dmsf::StandardOperation.new
  end

  # GET /dmsf/standard_operations/1/edit
  def edit
  end

  # POST /dmsf/standard_operations
  # POST /dmsf/standard_operations.json
  def create
    @dmsf_standard_operation = Dmsf::StandardOperation.new(dmsf_standard_operation_params)

    respond_to do |format|
      if @dmsf_standard_operation.save
        format.html { redirect_to dmsf_standard_operations_url, notice: t('.notice') }
        format.json { render :show, status: :created, location: @dmsf_standard_operation }
      else
        format.html { render :new }
        format.json { render json: @dmsf_standard_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dmsf/standard_operations/1
  # PATCH/PUT /dmsf/standard_operations/1.json
  def update
    respond_to do |format|
      if @dmsf_standard_operation.update(dmsf_standard_operation_params)
        format.html { redirect_to dmsf_standard_operations_url, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @dmsf_standard_operation }
      else
        format.html { render :edit }
        format.json { render json: @dmsf_standard_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dmsf/standard_operations/1
  # DELETE /dmsf/standard_operations/1.json
  def destroy
    @dmsf_standard_operation.destroy
    respond_to do |format|
      format.html { redirect_to dmsf_standard_operations_url, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dmsf_standard_operation
      @dmsf_standard_operation = Dmsf::StandardOperation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dmsf_standard_operation_params
      params.require(:dmsf_standard_operation).permit(:name, :debits_account_id, :credits_account_id, :document_definition_id)
    end
end
