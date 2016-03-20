class Dmsf::StandardOperation < ApplicationRecord
  belongs_to :debits_account, class_name: 'Dmsf::Account'
  belongs_to :credits_account, class_name: 'Dmsf::Account'
  belongs_to :document_definition

  validates :name, presence: true

  def analytic_types
    Dmsf::AnalyticType.where(id: [
      debits_account.analytic_type1_id,
      debits_account.analytic_type2_id,
      credits_account.analytic_type1_id,
      credits_account.analytic_type2_id
    ])
  end
end
