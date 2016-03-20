class Dmsf::Document < ApplicationRecord
  belongs_to :document_definition
  belongs_to :standard_operation
  has_and_belongs_to_many :analytics
  has_one :entry, inverse_of: :document
  accepts_nested_attributes_for :entry, update_only: true
end
