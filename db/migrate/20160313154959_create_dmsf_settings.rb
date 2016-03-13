class CreateDmsfSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :dmsf_settings do |t|
      t.date :current_date
      t.date :start_date
      t.date :end_date
      t.integer :current_account_id, index: true
      t.string :organization_name

      t.timestamps
    end

    add_foreign_key :dmsf_settings, :dmsf_accounts, column: :current_account_id
  end
end
