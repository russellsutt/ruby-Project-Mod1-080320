require 'rest-client'
require 'json'
require 'pry'

House.destroy_all
Room.destroy_all
Adventure.destroy_all
Item.destroy_all
Character.destroy_all
Library.destroy_all
User.destroy_all
UserHouse.destroy_all
UserSkillSet.destroy_all
UserLibrary.destroy_all
SkillSet.destroy_all

library = Library.new(name: "The Winterfell Library")
#skill_set = SkillSet.new(sword_fighting: 1, archery: 1, horse_riding: 1, survival_skills: 1, fatigue: 1)

#Creates house data
stark = GameOfThronesApi.find_house("stark")
targaryen = GameOfThronesApi.find_house("targaryen")
lannister = GameOfThronesApi.find_house("House Lannister of Casterly Rock")
martel = GameOfThronesApi.find_house("martel")

#method to add data to house table
def house_data(house)
    house.map do |data|
        House.create(name: data["name"], region: data["region"], coat_of_arms: data["coatOfArms"], words: data["words"], founded: data["founded"], died_out: data["diedOut"])
    end
end


stark_house = house_data(stark)
targaryen_house = house_data(targaryen)
lannister_house = house_data(lannister)
martel_house = house_data(martel)

room = Room.create(name: "bed chamber", house_id: stark_house)

#Create Stark Adventure
stark_adventure = Adventure.create(name: "Stark Adventure", house: House.first)

#Creates items for Stark adventures
itemone = Item.create(name: "sword", adventure_id: stark_house)
itemtwo = Item.create(name: "direwolf", adventure_id: stark_house)
itemthree = Item.create(name: "gold dragons", adventure_id: stark_house)

arya = GameOfThronesApi.find_character('Arya Stark')
sansa = GameOfThronesApi.find_character('Sansa Stark')
ned = GameOfThronesApi.find_character('Eddard Stark')
robb = GameOfThronesApi.find_character('Robb Stark')
jon = GameOfThronesApi.find_character('Jon Snow')

def character_data(character)
    character.map { |character| Character.create(name: character["name"], titles: character["titles"].first, quote: "nil", house_id: House.first.id) }
end

arya_data = character_data(arya)
sansa_data = character_data(sansa)
ned_data = character_data(ned)
robb_data = character_data(robb)
jon_data = character_data(jon)

arya_quote = "Leave one wolf alive and the sheep are never safe."
sansa_quote = "You're going to die tomorrow, Lord Bolton. Sleep well."
ned_quote = "You think my life is such a precious thing to me, that I would trade my honor for a few more years... of what?"
robb_quote = "Tell Lord Tywin winter is coming for him. Twenty thousand northerners marching south to find out if he really does shit gold."
jon_quote = "They were born on the wrong side of the Wall — doesn’t make them monsters."

Character.first.update(quote: "Leave one wolf alive and the sheep are never safe.")
Character.second.update(quote: "You're going to die tomorrow, Lord Bolton. Sleep well.")
Character.third.update(quote: "You think my life is such a precious thing to me, that I would trade my honor for a few more years... of what?")
Character.fourth.update(quote: "Tell Lord Tywin winter is coming for him. Twenty thousand northerners marching south to find out if he really does shit gold.")
Character.fifth.update(quote: "They were born on the wrong side of the Wall — doesn’t make them monsters.")

    
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

