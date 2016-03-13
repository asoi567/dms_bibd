class Dmsf::Account < ApplicationRecord
  enum kind: {not_used: 0, only_debit: 1, only_credit: 2, debit_credit: 3}

  belongs_to :analytic_type1, class_name: 'Dmsf::AnalyticType', optional: true
  belongs_to :analytic_type2, class_name: 'Dmsf::AnalyticType', optional: true

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :kind, presence: true
end
