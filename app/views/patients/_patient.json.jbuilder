json.extract! patient, :id, :name, :age, :symptom, :created_at, :updated_at
json.url patient_url(patient, format: :json)
