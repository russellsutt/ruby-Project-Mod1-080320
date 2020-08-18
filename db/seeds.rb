require 'rest-client'
require 'json'
require 'pry'



def stark_characters
    starks = []
    starks << GameOfThronesApi.find_character('Arya Stark')
    starks << GameOfThronesApi.find_character('Sansa Stark')
    starks << GameOfThronesApi.find_character('Eddard Stark')
    starks << GameOfThronesApi.find_character('Robb Stark')
    starks << GameOfThronesApi.find_character('Jon Snow')
    starks
end





# puts "here for pry"
