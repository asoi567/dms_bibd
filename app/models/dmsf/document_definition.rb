class Dmsf::DocumentDefinition < ApplicationRecord
  validates :name, presence: true
end
