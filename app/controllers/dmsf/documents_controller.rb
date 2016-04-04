class Dmsf::DocumentsController < ApplicationController
  before_action :set_dmsf_document, only: [:show, :edit, :update, :destroy]

  def index
    @dmsf_documents = Dmsf::Document.all
  end

  def show
  end

  def new
    @dmsf_document = Dmsf::Document.new(
      date: settings.current_date,
      entry: Dmsf::Entry.new(date: settings.current_date)
    )
  end

  def edit
  end

  def create
    @dmsf_document = Dmsf::Document.new(dmsf_document_params)

    respond_to do |format|
      if @dmsf_document.save
        format.html { redirect_to dmsf_documents_url, notice: t('.notice') }
        format.json { render :show, status: :created, location: @dmsf_document }
      else
        format.html { render :new }
        format.json { render json: @dmsf_document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dmsf_document.update(dmsf_document_params)
        format.html { redirect_to dmsf_documents_url, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @dmsf_document }
      else
        format.html { render :edit }
        format.json { render json: @dmsf_document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dmsf_document.destroy
    respond_to do |format|
      format.html { redirect_to dmsf_documents_url, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private

  def set_dmsf_document
    @dmsf_document = Dmsf::Document.find(params[:id])
  end

  def dmsf_document_params
    params.require(:dmsf_document).permit(
      :name, :number, :date, :document_definition_id, :standard_operation_id,
      analytic_ids: [],
      entry_attributes: [:debits_account_id, :credits_account_id, :amount, :date]
    )
  end
end
