json.extract! membership, :id, :society_id, :periodicidad, :fecha_afiliacion, :fecha_vencimiento, :fecha_cuota, :created_at, :updated_at
json.url membership_url(membership, format: :json)