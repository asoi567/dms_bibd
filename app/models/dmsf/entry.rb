class Dmsf::Entry < ApplicationRecord
  belongs_to :document
  belongs_to :debits_account, class_name: 'Dmsf::Account'
  belongs_to :credits_account, class_name: 'Dmsf::Account'
end
