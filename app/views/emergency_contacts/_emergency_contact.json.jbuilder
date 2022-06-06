json.extract! emergency_contact, :id, :name, :relationship, :contact_address, :telephone, :student_id, :created_at, :updated_at
json.url emergency_contact_url(emergency_contact, format: :json)
