require 'csv'

Category.delete_all

ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='categories';")

filename = Rails.root.join('db/plant_store.csv')

puts "Loading Plants from the CSV file: #{filename}"

csv_data = File.read(filename)

plants = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

plants.each do |x|
  category_name = x['category']
  plant_name = x['name']
  description = x['description']
  price =  x['price'].gsub(/[$,]/, '').to_f

  category = Category.find_or_create_by(name: category_name)

  # Print the category and plant details for debugging
  puts "Category: #{category_name}"
  puts "Plant: #{plant_name}, Description: #{description}, Price: #{price}"

  plant = category.plants.create(
    name: plant_name,
    description:,
    price:,
    stock: rand(1..100)
  )

  # Print a message indicating whether the plant was created
  if plant.persisted?
    puts 'Plant created successfully.'
  else
    puts 'Failed to create plant.'
  end
end
