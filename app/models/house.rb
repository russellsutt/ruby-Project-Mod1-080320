require 'tty-prompt'
require 'pry'
require 'colorize'

class House < ActiveRecord::Base
    has_many :user_houses
    has_many :users, through: :user_houses
    has_many :characters
    has_one :adventure
    has_one :room

    def welcome_home
        prompt = TTY::Prompt.new
        player_selection = prompt.select("What would you like to do?") do |menu|
            menu.choice name: "Talk to family", value: 1
            menu.choice name: "Go to your room.", value: 2
            menu.choice name: "Go to the library.", value: 3
            menu.choice name: "Train Skills", value: 4
            menu.choice name: "Go on an adventure.", value: 5
            menu.choice name: "Back to main menu.", value: 6
        end
        if player_selection == 1
            Character.talk_to_family
        elsif player_selection == 2
            Room.user_room
        elsif player_selection == 3
            Library.library_menu
        elsif player_selection == 4
            
        elsif player_selection == 5

        else player_selection == 6
            cli = CLI.new
            cli.start
        end
    end

end