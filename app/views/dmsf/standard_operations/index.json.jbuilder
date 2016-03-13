json.array!(@dmsf_standard_operations) do |dmsf_standard_operation|
  json.extract! dmsf_standard_operation, :id, :name, :debits_account_id, :credits_account_id, :document_definition_id
  json.url dmsf_standard_operation_url(dmsf_standard_operation, format: :json)
end
