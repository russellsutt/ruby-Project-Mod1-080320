require 'pry'
require 'tty-prompt'

class House < ActiveRecord::Base
    has_many :user_houses
    has_many :users, through: :user_houses
    has_many :characters
    has_one :adventure
    has_one :room

    def self.welcome_home
        prompt = TTY::Prompt.new
        player_selection = prompt.select("What would you like to do?") do |menu|
            menu.choice name: "Talk to family", value: 1
            menu.choice name: "Go to your room.", value: 2
            menu.choice name: "Go to the library.", value: 3
            menu.choice name: "Train Skills", value: 4
            menu.choice name: "Go on an adventure.", value: 5        
        end

        if player_selection == 1            
            Characters.talk_to_family
        elsif player_selection == 5
            #for Winterfell adventure
            Adventure.create(name: "Stark Adventure", house: House.first)
            Adventure.first.start_winterfell_adventure        
        end   
    end
end
