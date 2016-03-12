class Dmsf::AnalyticType < ApplicationRecord
  has_many :analytics, dependent: :destroy

  validates :name, presence: true
end
