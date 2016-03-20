json.extract! @dmsf_standard_operation, :id, :name

json.document_definition do
  json.extract! @dmsf_standard_operation.document_definition, :id, :name
end

json.debits_account do
  json.extract! @dmsf_standard_operation.debits_account, :id, :code, :name, :full_name
end

json.credits_account do
  json.extract! @dmsf_standard_operation.credits_account, :id, :code, :name, :full_name
end
