require 'tty-prompt'

class User < ActiveRecord::Base
    has_many :skills
    has_many :user_houses
    has_many :houses,through: :user_houses

    def self.login
        prompt = TTY::Prompt.new
        name = prompt.ask("Please login.  What is your character name?")
        password = prompt.mask("What is your password?")
        gender = prompt.ask("Are you a boy or a girl?")
        User.find_or_create_by(name: name, password: password, gender: gender)
    end

    def self.start_game
        prompt = TTY::Prompt.new
        prompt.select("Please pick an option?") do |menu|
            menu.choice name: "Start a new Game", value: 1
            menu.choice name: "Continue Game", value: 2
            menu.choice name: "Quit", value: 3
        end
    end

    # def self.pick_a_house
    #     prompt = TTY::Prompt.new
    #     house = prompt.select("Please pick an house?") do |menu|
    #         menu.choice name: "House Stark of Winterfell", value: 1
    #     end
    #     #need to have if/elis/else if they pick another house
    #     if house == 1
    #         UserHouse.create(user: self, house: House.find_by(name: house))
    #     end
    # end

    def view_profile
        puts "Your character name is #{self.name}"
    end
end