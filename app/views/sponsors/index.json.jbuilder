json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :title, :first_name, :last_name, :email, :phone
  json.url sponsor_url(sponsor, format: :json)
end
