json.array!(@dmsf_document_definitions) do |dmsf_document_definition|
  json.extract! dmsf_document_definition, :id, :name
  json.url dmsf_document_definition_url(dmsf_document_definition, format: :json)
end
