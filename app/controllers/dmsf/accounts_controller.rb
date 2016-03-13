class Dmsf::AccountsController < ApplicationController
  before_action :set_dmsf_account, only: [:show, :edit, :update, :destroy]

  # GET /dmsf/accounts
  # GET /dmsf/accounts.json
  def index
    @dmsf_accounts = Dmsf::Account.all
  end

  # GET /dmsf/accounts/1
  # GET /dmsf/accounts/1.json
  def show
  end

  # GET /dmsf/accounts/new
  def new
    @dmsf_account = Dmsf::Account.new
  end

  # GET /dmsf/accounts/1/edit
  def edit
  end

  # POST /dmsf/accounts
  # POST /dmsf/accounts.json
  def create
    @dmsf_account = Dmsf::Account.new(dmsf_account_params)

    respond_to do |format|
      if @dmsf_account.save
        format.html { redirect_to dmsf_accounts_url, notice: t('.notice') }
        format.json { render :show, status: :created, location: @dmsf_account }
      else
        format.html { render :new }
        format.json { render json: @dmsf_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dmsf/accounts/1
  # PATCH/PUT /dmsf/accounts/1.json
  def update
    respond_to do |format|
      if @dmsf_account.update(dmsf_account_params)
        format.html { redirect_to dmsf_accounts_url, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @dmsf_account }
      else
        format.html { render :edit }
        format.json { render json: @dmsf_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dmsf/accounts/1
  # DELETE /dmsf/accounts/1.json
  def destroy
    @dmsf_account.destroy
    respond_to do |format|
      format.html { redirect_to dmsf_accounts_url, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dmsf_account
      @dmsf_account = Dmsf::Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dmsf_account_params
      params.require(:dmsf_account).permit(:name, :analytic_type1_id, :analytic_type2_id, :code, :kind)
    end
end
