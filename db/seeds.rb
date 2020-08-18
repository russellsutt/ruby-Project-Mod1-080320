require 'rest-client'
require 'json'
require 'pry'

House.destroy_all
Room.destroy_all
Adventure.destroy_all

#Below is API request for the four houses / House.third is Stark
    url = "https://anapioficeandfire.com/api/houses"
    response = RestClient.get(url)
    data = JSON.parse(response)
    current_pg = 1
    while current_pg < 47
        new_url = url + "?page=#{current_pg}"
        response = RestClient.get(new_url)
        data = JSON.parse(response)
        data.each do |d|
            if d["name"] == "House Stark of Winterfell" || d["name"] == "House Lannister of Casterly Rock" || d["name"] == "House Targaryen of King's Landing" || d["name"] == "House Nymeros Martell of Sunspear"
                house = House.create(name: d["name"], region: d["region"], coat_of_arms: d["coatOfArms"], words: d["words"], founded: d["founded"], died_out: d["diedOut"])                           
            end
        end
        current_pg += 1
    end
    
    #Creates room that belongs to Stark house
    room = Room.create(name: "bedroom", house: House.third)


    #Creates adventure for Stark house
    adventure = Adventure.create(name: "adventure", house: House.third)

    binding.pry
    puts "for pry"
 


