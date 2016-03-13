class CreateDmsfStandardOperations < ActiveRecord::Migration[5.0]
  def change
    create_table :dmsf_standard_operations do |t|
      t.string :name
      t.integer :debits_account_id, index: true
      t.integer :credits_account_id, index: true
      t.integer :document_definition_id, index: true

      t.timestamps
    end

    add_foreign_key :dmsf_standard_operations, :dmsf_accounts, column: :debits_account_id
    add_foreign_key :dmsf_standard_operations, :dmsf_accounts, column: :credits_account_id
    add_foreign_key :dmsf_standard_operations, :dmsf_document_definitions, column: :document_definition_id
  end
end
