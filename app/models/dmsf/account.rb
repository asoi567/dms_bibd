class Dmsf::Account < ApplicationRecord
  enum kind: {not_used: 0, only_debit: 1, only_credit: 2, debit_credit: 3}

  belongs_to :analytic_type1, class_name: 'Dmsf::AnalyticType', optional: true
  belongs_to :analytic_type2, class_name: 'Dmsf::AnalyticType', optional: true
  has_many :debet_standard_operations, class_name: 'Dmsf::StandardOperation', foreign_key: :debits_account_id
  has_many :credit_standard_operations, class_name: 'Dmsf::StandardOperation', foreign_key: :credits_account_id
  has_many :debet_entries, class_name: 'Dmsf::Entry', foreign_key: :debits_account_id
  has_many :credit_entries, class_name: 'Dmsf::Entry', foreign_key: :credits_account_id

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :kind, presence: true

  def full_name
    "#{code} #{name}"
  end
end
