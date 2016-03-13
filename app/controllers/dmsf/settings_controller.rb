class Dmsf::SettingsController < ApplicationController
  def edit
  end

  def update
    respond_to do |format|
      if settings.update(dmsf_setting_params)
        format.html { redirect_to edit_dmsf_setting_url, notice: t('.notice') }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def dmsf_setting_params
    params.require(:dmsf_setting).permit(
      :name, :current_date, :start_date, :end_date, :current_account_id, :organization_name
    )
  end
end
