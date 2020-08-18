require 'rest-client'
require 'json'
require 'pry'

houses_response = RestClient.get("https://anapioficeandfire.com/api/houses")
houses_data = JSON.parse(houses_response)

binding.pry

puts "here for pry"
# houses_data.collect do |house|
#         house # house["name"]
# end