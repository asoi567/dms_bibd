json.array!(@dmsf_analytic_types) do |dmsf_analytic_type|
  json.extract! dmsf_analytic_type, :id, :name
  json.url dmsf_analytic_type_url(dmsf_analytic_type, format: :json)
end
