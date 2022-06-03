json.extract! student, :id, :update_date, :student_furigana, :student_name, :sex, :birthday, :telephone, :cellphone, :adress, :parents_furigana, :parents_name, :relationship, :created_at, :updated_at
json.url student_url(student, format: :json)
