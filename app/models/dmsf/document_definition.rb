class Dmsf::DocumentDefinition < ApplicationRecord
  has_many :standard_operations

  validates :name, presence: true
end
