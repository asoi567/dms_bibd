class Dmsf::Analytic < ApplicationRecord
  belongs_to :analytic_type

  validates :name, presence: true
end
