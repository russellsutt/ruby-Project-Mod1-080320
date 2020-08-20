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
        puts "Welcome home, #{User.last.name} Stark.".colorize(:light_blue)
        puts "Take a look around and explore the castle!".colorize(:light_blue)
        prompt = TTY::Prompt.new
        player_selection = prompt.select("What would you like to do?".colorize(:light_yellow)) do |menu|
            menu.choice name: "Talk to family.", value: 1
            menu.choice name: "Go to your room.", value: 2
            menu.choice name: "Go to the library.", value: 3
            menu.choice name: "Train Skills.", value: 4
            menu.choice name: "Go on an adventure.", value: 5
            menu.choice name: "View character.", value: 6
            menu.choice name: "Back to main menu.".colorize(:light_green), value: 7
        end
        if player_selection == 1
            Character.talk_to_family
        elsif player_selection == 2
            UserRoom.create(user_id: House.first.user_houses.last.user.id, room_id: Room.first.id)
            Room.user_room
        elsif player_selection == 3
            UserLibrary.create(user_id: House.first.user_houses.last.user.id, library_id: Library.first.id)
            Library.library_menu
        elsif player_selection == 4
            user = UserHouse.last.user
            user.skill_training
        elsif player_selection == 5
            #for Winterfell adventure
            UserAdventure.create(user: House.first.user_houses.last.user, adventure: Adventure.first)
            Adventure.first.start_winterfell_adventure #picks stark game story       
        elsif player_selection == 6
            user = User.last
            box = TTY::Box.info (
                "You are #{user.name} Stark, of House Stark.
                Your sword fighting skill is #{user.user_skill_sets.last.skill_set.sword_fighting}!
                Your archery skill is #{user.user_skill_sets.last.skill_set.archery}!
                Your horse riding skill is #{user.user_skill_sets.last.skill_set.horse_riding}!
                Your survival skill is #{user.user_skill_sets.last.skill_set.survival_skills}!
                Your intelligence skill is #{user.user_skill_sets.last.skill_set.intelligence}
                Your fatigue level is #{user.user_skill_sets.last.skill_set.fatigue}")
            puts box
            sleep(4)
            welcome_home
        else player_selection == 7
            CLI.start_game
        end
    end
end
