class Dmsf::AnalyticType < ApplicationRecord
  has_many :analytics, dependent: :destroy
  has_many :accounts1, as: :analytic_type1
  has_many :accounts2, as: :analytic_type2

  validates :name, presence: true
end
