class Dmsf::Analytic < ApplicationRecord
  belongs_to :analytic_type
  has_and_belongs_to_many :documents

  validates :name, presence: true
end
