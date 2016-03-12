class CreateDmsfAnalyticTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :dmsf_analytic_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
