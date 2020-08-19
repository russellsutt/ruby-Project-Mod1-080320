require 'pry'
require 'tty-prompt'

class CLI

    def start
        puts "Welcome to Game of Thrones CLI!"

        Adventure.start

        binding.pry


        user = User.login
        User.start_game

        #User.pick_a_house

    #self.pick_a_house
        prompt = TTY::Prompt.new
        house_selection = prompt.select("Please pick an house?") do |menu|
            menu.choice name: "House Stark of Winterfell", value: 1
        end
        #need to have if/elis/else if they pick another house
        if house_selection == 1
            UserHouse.create(user: user, house: House.find_by(name: "House Stark of Winterfell"))
        end
    
        
        #binding.pry 
        #find user or create user
        #intro screen with music/image
       
       
    end
end
