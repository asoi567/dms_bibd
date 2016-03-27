class Dmsf::Entry < ApplicationRecord
  belongs_to :document
  has_one :standard_operation, through: :document
  belongs_to :debits_account, class_name: 'Dmsf::Account'
  belongs_to :credits_account, class_name: 'Dmsf::Account'

  def debit
    debits_account.try(:full_name)
  end

  def credit
    credits_account.try(:full_name)
  end

  def full_name
    "Дт #{debits_account.code} - Кт #{credits_account.code} : #{amount} BYN"
  end
end
