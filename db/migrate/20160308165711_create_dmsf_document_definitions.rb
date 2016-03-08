class CreateDmsfDocumentDefinitions < ActiveRecord::Migration[5.0]
  def change
    create_table :dmsf_document_definitions do |t|
      t.string :name

      t.timestamps
    end
  end
end
