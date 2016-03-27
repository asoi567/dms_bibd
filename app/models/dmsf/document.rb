class Dmsf::Document < ApplicationRecord
  belongs_to :document_definition
  belongs_to :standard_operation
  has_and_belongs_to_many :analytics, foreign_key: :dmsf_document_id, association_foreign_key: :dmsf_analytic_id
  has_one :entry, inverse_of: :document
  accepts_nested_attributes_for :entry, update_only: true

  def analytic_types
    standard_operation.try(:analytic_types) || []
  end

  def full_name
    "#{name} №#{number} от #{date}"
  end
end
