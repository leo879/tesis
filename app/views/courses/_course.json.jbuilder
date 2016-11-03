json.extract! course, :id, :nombre, :descripcion, :valor_sesion, :valor_total, :id_category_id, :created_at, :updated_at
json.url course_url(course, format: :json)