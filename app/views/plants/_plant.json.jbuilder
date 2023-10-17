json.extract! plant, :id, :name, :description, :price, :stock, :category_id, :created_at, :updated_at
json.url plant_url(plant, format: :json)
