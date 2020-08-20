require 'tty-prompt'
require 'pry'
require 'colorize'
require 'catpix'

class House < ActiveRecord::Base
    has_many :user_houses
    has_many :users, through: :user_houses
    has_many :characters
    has_one :adventure
    has_one :room

    def welcome_home
        Catpixel.catpix_high('assets/images/stark/winterfell-01.jpg')
        prompt = TTY::Prompt.new
        player_selection = prompt.select("What would you like to do?".colorize(:light_yellow)) do |menu|
            menu.choice name: "Talk to family", value: 1
            menu.choice name: "Go to your room.", value: 2
            menu.choice name: "Go to the library.", value: 3
            menu.choice name: "Train Skills", value: 4
            menu.choice name: "Go on an adventure.", value: 5
            menu.choice name: "View character.", value: 6
            menu.choice name: "Back to main menu.".colorize(:light_green), value: 7
        end
        if player_selection == 1
            Character.talk_to_family
        elsif player_selection == 2
            Room.user_room
        elsif player_selection == 3
            Library.library_menu
        elsif player_selection == 4
            
        elsif player_selection == 5

        elsif player_selection == 6
            User.who_am_i
            # User.last.skill_set
            sleep(2)
            welcome_home
        else player_selection == 7
            CLI.start_game
        end
    end
end