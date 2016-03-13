class CreateDmsfAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :dmsf_accounts do |t|
      t.string :name
      t.string :code
      t.integer :kind, default: 0
      t.integer :analytic_type1_id, index: true
      t.integer :analytic_type2_id, index: true

      t.timestamps
    end

    add_foreign_key :dmsf_accounts, :dmsf_analytic_types, column: :analytic_type1_id
    add_foreign_key :dmsf_accounts, :dmsf_analytic_types, column: :analytic_type2_id
  end
end
