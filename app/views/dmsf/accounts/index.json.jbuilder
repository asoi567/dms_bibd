json.array!(@dmsf_accounts) do |dmsf_account|
  json.extract! dmsf_account, :id, :name, :analytic_type1_id, :analytic_type2_id, :code, :type
  json.url dmsf_account_url(dmsf_account, format: :json)
end
