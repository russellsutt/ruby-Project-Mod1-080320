require 'pry'
require 'tty-prompt'

class CLI

    def start
        puts "Welcome to Game of Thrones CLI!"
        prompt = TTY::Prompt.new
        name = prompt.ask("What is your username")
        password = prompt.mask("What is your password")
        #find user or create user
        #intro screen with music/image
       
        #prompt.select("What would you like to do?",(("Start a new game?") ("Continue Game")
        # pick house and return message witht their name and house
        
        binding.pry
    end
end
