class CreateDmsfAnalytics < ActiveRecord::Migration[5.0]
  def change
    create_table :dmsf_analytics do |t|
      t.string :name
      t.integer :analytic_type_id, index: true

      t.timestamps
    end

    add_foreign_key :dmsf_analytics, :dmsf_analytic_types, column: :analytic_type_id
  end
end
