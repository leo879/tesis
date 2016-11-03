json.extract! client_course, :id, :client_id, :course_id, :created_at, :updated_at
json.url client_course_url(client_course, format: :json)