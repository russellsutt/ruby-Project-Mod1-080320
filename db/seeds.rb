require 'rest-client'
require 'json'
require 'pry'

House.destroy_all

    array = []
    url = "https://anapioficeandfire.com/api/houses"
    url + "?page=1"
    response = RestClient.get(url)
    data = JSON.parse(response)
    #test
    data.each do |data|
        array << data
    end
    current_pg = 2
    while pg_num < 47
        url += "?page=#{current_pg}"
        response = RestClient.get(url)
        #while response.success?
            data = JSON.parse(response)
            #test
            data.each do |d|
                array << d
            end
        #end
        current_pg += 1
    end
    
    binding.pry

    puts "test"
 
# houses_response = RestClient.get("https://anapioficeandfire.com/api/houses?pageSize=50")
# houses_data = JSON.parse(houses_response)

# houses_data.each do |h|
#     house = House.new()
#     house.name = h["name"]
#     house.region = h["region"]
#     house.coat_of_arms = h["coatOfArms"]
#     house.words = h["words"]
#     house.founded = h["founded"]
#     house.died_out = h["diedOut"]
#     #binding.pry
#     house.save
# end




# # houses_data.collect do |house|
# #         house # house["name"]
# # end