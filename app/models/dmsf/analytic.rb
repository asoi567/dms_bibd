class Dmsf::Analytic < ApplicationRecord
  belongs_to :analytic_type
  has_and_belongs_to_many :documents, association_foreign_key: :dmsf_document_id, foreign_key: :dmsf_analytic_id

  validates :name, presence: true
end
