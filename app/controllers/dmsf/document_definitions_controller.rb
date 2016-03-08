class Dmsf::DocumentDefinitionsController < ApplicationController
  before_action :set_dmsf_document_definition, only: [:show, :edit, :update, :destroy]

  # GET /dmsf/document_definitions
  # GET /dmsf/document_definitions.json
  def index
    @dmsf_document_definitions = Dmsf::DocumentDefinition.all
  end

  # GET /dmsf/document_definitions/1
  # GET /dmsf/document_definitions/1.json
  def show
  end

  # GET /dmsf/document_definitions/new
  def new
    @dmsf_document_definition = Dmsf::DocumentDefinition.new
  end

  # GET /dmsf/document_definitions/1/edit
  def edit
  end

  # POST /dmsf/document_definitions
  # POST /dmsf/document_definitions.json
  def create
    @dmsf_document_definition = Dmsf::DocumentDefinition.new(dmsf_document_definition_params)

    respond_to do |format|
      if @dmsf_document_definition.save
        format.html { redirect_to dmsf_document_definitions_url, notice: t('.notice') }
        format.json { render :show, status: :created, location: @dmsf_document_definition }
      else
        format.html { render :new }
        format.json { render json: @dmsf_document_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dmsf/document_definitions/1
  # PATCH/PUT /dmsf/document_definitions/1.json
  def update
    respond_to do |format|
      if @dmsf_document_definition.update(dmsf_document_definition_params)
        format.html { redirect_to dmsf_document_definitions_url, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @dmsf_document_definition }
      else
        format.html { render :edit }
        format.json { render json: @dmsf_document_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dmsf/document_definitions/1
  # DELETE /dmsf/document_definitions/1.json
  def destroy
    @dmsf_document_definition.destroy
    respond_to do |format|
      format.html { redirect_to dmsf_document_definitions_url, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dmsf_document_definition
    @dmsf_document_definition = Dmsf::DocumentDefinition.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dmsf_document_definition_params
    params.require(:dmsf_document_definition).permit(:name)
  end
end
