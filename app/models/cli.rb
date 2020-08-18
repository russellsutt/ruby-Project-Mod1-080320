require 'pry'

class CLI

    def start
        puts "Welcome to Winterfell!"
        user = User.login
    end
end


