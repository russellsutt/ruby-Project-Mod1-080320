require 'rest-client'
require 'json'
require 'pry'
require 'game_of_thrones_api'

House.destroy_all
Room.destroy_all
Adventure.destroy_all
Item.destroy_all


stark = GameOfThronesApi.find_house("stark")
targaryen = GameOfThronesApi.find_house("targaryen")
lannister = GameOfThronesApi.find_house("House Lannister of Casterly Rock")
martel = GameOfThronesApi.find_house("martel")

stark.each do |house|
    stark_house = House.create(name: house["name"], region: house["region"], coat_of_arms: house["coatOfArms"], words: house["words"], founded: house["founded"], died_out: house["diedOut"])
end
targaryen.each do |house|
    targaryen_house = House.create(name: house["name"], region: house["region"], coat_of_arms: house["coatOfArms"], words: house["words"], founded: house["founded"], died_out: house["diedOut"])
end
lannister.each do |house|
    lannister_house = House.create(name: house["name"], region: house["region"], coat_of_arms: house["coatOfArms"], words: house["words"], founded: house["founded"], died_out: house["diedOut"])
end
martel.each do |house|
    martel_house = House.create(name: house["name"], region: house["region"], coat_of_arms: house["coatOfArms"], words: house["words"], founded: house["founded"], died_out: house["diedOut"])
end

    
#Creates room that belongs to Stark house
room = Room.create(name: "bed chamber", house: House.first)


#Creates adventure for Stark house    
adventure = Adventure.create(name: "adventure", house: House.first)

#Creates items for Stark adventures
itemone = Item.create(name: "sword", adventure: Adventure.first)
itemtwo = Item.create(name: "direwolf", adventure: Adventure.first)
itemthree = Item.create(name: "gold dragons", adventure: Adventure.first)

    
binding.pry

puts "for pry"
 




    
#House.create(name: d["name"], region: d["region"], coat_of_arms: d["coatOfArms"], words: d["words"], founded: d["founded"], died_out: d["diedOut"])
#Below is API request for the four houses / House.third is Stark
    # url = "https://anapioficeandfire.com/api/houses"
    # response = RestClient.get(url)
    # data = JSON.parse(response)
    # current_pg = 1
    # while current_pg < 47
    #     new_url = url + "?page=#{current_pg}"
    #     response = RestClient.get(new_url)
    #     data = JSON.parse(response)
    #     data.each do |d|
    #         if d["name"] == "House Stark of Winterfell" || d["name"] == "House Lannister of Casterly Rock" || d["name"] == "House Targaryen of King's Landing" || d["name"] == "House Nymeros Martell of Sunspear"
    #             house = House.create(name: d["name"], region: d["region"], coat_of_arms: d["coatOfArms"], words: d["words"], founded: d["founded"], died_out: d["diedOut"])                           
    #         end
    #     end
    #     current_pg += 1
    # end

