class Dmsf::Analytic < ApplicationRecord
  belongs_to :analytic_type
  validates :analytic_type, presence: true
  validates :name, presence: true
end
