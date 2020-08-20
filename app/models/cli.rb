require 'pry'
require 'tty-prompt'

class CLI

    def start
        puts "Welcome to Game of Thrones CLI!"
        # sleep (2)
        user = User.login
        prompt = TTY::Prompt.new
        sleep (2)
        user.create_skill_set #if new user
        user.start_game
        house_selection = prompt.select("Please pick a house?") do |menu|
            menu.choice name: "House Stark of Winterfell", value: 1
            menu.choice name: "House Lannister of Casterly Rock", value: 2, disabled: "(Everyone in this house is dead.)"
            end
        if house_selection == 1
            UserHouse.find_or_create_by(user_id: user.id, house_id: House.first.id)
            # sleep (2)
            puts "Welcome to House Stark, #{user.name} Stark."
            # sleep (2)
            prompt.select("Enter Winterfell", %w(Enter))
            puts "Welcome home, #{user.name} Stark."
            # sleep (2)
            puts "Take a look around and explore the castle!"
            House.welcome_home
        end

 
    end


    # User.last.user_houses.first.house
end
