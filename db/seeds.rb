require 'csv'

Category.delete_all

ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='categories';")

filename = Rails.root.join('db/plant_store.csv')

puts "Loading Plants from the CSV file: #{filename}"

csv_data = File.read(filename)

plants = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

plants.each do |pl|
  category = Category.find_or_create_by(name: pl['category'])

  plant = category.plants.create(
    name: pl['name'],
    description: pl['description'],
    price: pl['price'].gsub('$', ''),
    stock: rand(1..100)
  )

  # Print a message indicating whether the plant was created
  if plant.persisted?
    puts 'Plant created successfully.'
  else
    puts 'Failed to create plant.'
  end
end
