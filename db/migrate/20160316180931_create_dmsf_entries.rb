class CreateDmsfEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :dmsf_entries do |t|
      t.integer :document_id, index: true, null: false
      t.integer :debits_account_id, index: true, null: false
      t.integer :credits_account_id, index: true, null: false
      t.integer :amount, null: false, default: 0
      t.date :date, null: false

      t.timestamps
    end

    add_foreign_key :dmsf_entries, :dmsf_documents, column: :document_id
    add_foreign_key :dmsf_entries, :dmsf_accounts, column: :debits_account_id
    add_foreign_key :dmsf_entries, :dmsf_accounts, column: :credits_account_id
  end
end
