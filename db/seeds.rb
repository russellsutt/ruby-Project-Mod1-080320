require 'rest-client'
require 'json'
require 'pry'

Character.destroy_all
User.destroy_all



arya = GameOfThronesApi.find_character('Arya Stark')
sansa = GameOfThronesApi.find_character('Sansa Stark')
ned = GameOfThronesApi.find_character('Eddard Stark')
robb = GameOfThronesApi.find_character('Robb Stark')
jon = GameOfThronesApi.find_character('Jon Snow')


def character_data(character)
    character.each { |character| Character.create(name: character["name"], titles: character["titles"])}
end


arya_character = character_data(arya)
sansa_character = character_data(sansa)
ned_character = character_data(ned)
robb_character = character_data(robb)
jon_character = character_data(jon)



# puts "here for pry"
