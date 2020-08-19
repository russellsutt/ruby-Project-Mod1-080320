require 'tty-prompt'
require 'pry'

class User < ActiveRecord::Base
    has_many :user_skill_sets
    has_one :skill_set, through: :user_skill_sets
    has_many :user_houses
    has_many :houses, through: :user_houses
    has_many :user_adventures
    has_one :adventure, through: :user_adventures
    has_many :user_libraries
    has_one :library, through: :user_libraries

    def self.login
        prompt = TTY::Prompt.new
        name = prompt.ask("Please login.  What is your character name?")
        password = prompt.mask("What is your password?")
        gender = prompt.ask("Are you a boy or a girl?")
        User.find_or_create_by(name: name, password: password, gender: gender)
    end

    def start_game
        prompt = TTY::Prompt.new
        selection = prompt.select("Please pick an option?") do |menu|
            menu.choice name: "Start a new Game", value: 1
            menu.choice name: "Continue Game", value: 2, disabled: "(No saved available.)"
            menu.choice name: "Quit", value: 3, disabled: "(You can't quit now!)"
        end
    end

    def view_profile
        puts "Your character name is #{self.name}"
    end
end