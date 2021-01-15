# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = HTTParty.get("https://pkgstore.datahub.io/core/s-and-p-500-companies/constituents_json/data/8fd832966a715a70cb9cf3f723498e3b/constituents_json.json")

response.each do |stock|
    new_stock = Stock.new
    new_stock.name = stock["Name"]
    new_stock.sector = stock["Sector"]
    new_stock.symbol = stock["Symbol"]
    new_stock.save
end