json.array!(@scholarships) do |scholarship|
  json.extract! scholarship, :id, :amount, :start_date, :end_date, :status, :student, :sponsor
  json.url scholarship_url(scholarship, format: :json)
end
