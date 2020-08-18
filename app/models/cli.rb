require 'pry'
require 'tty-prompt'

class CLI

    #User.destroy_all
    #UserHouse.destroy_all

    def start
        puts "Welcome to Game of Thrones CLI!"
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
            UserHouse.create(user: user, house: House.first)
        end
    
        
        #binding.pry 
        #find user or create user
        #intro screen with music/image
       
       
    end
end
