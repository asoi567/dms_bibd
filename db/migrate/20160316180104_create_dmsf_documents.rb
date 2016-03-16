class CreateDmsfDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :dmsf_documents do |t|
      t.string :name
      t.string :number
      t.date :date
      t.integer :document_definition_id, index: true
      t.integer :standard_operation_id, index: true

      t.timestamps
    end

    add_foreign_key :dmsf_documents, :dmsf_document_definitions, column: :document_definition_id
    add_foreign_key :dmsf_documents, :dmsf_standard_operations, column: :standard_operation_id

    create_join_table :dmsf_documents, :dmsf_analytics
  end
end
