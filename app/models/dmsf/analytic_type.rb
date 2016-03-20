class Dmsf::AnalyticType < ApplicationRecord
  has_many :analytics, dependent: :destroy
  has_many :accounts1
  has_many :accounts2

  validates :name, presence: true
end
