class Dmsf::StandardOperation < ApplicationRecord
  belongs_to :debits_account, class_name: 'Dmsf::Account'
  belongs_to :credits_account, class_name: 'Dmsf::Account'
  belongs_to :document_definition

  validates :name, presence: true
end
