json.array!(@dmsf_analytics) do |dmsf_analytic|
  json.extract! dmsf_analytic, :id, :name, :analytic_type_id
  json.url dmsf_analytic_url(dmsf_analytic, format: :json)
end
