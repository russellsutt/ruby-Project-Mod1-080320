require 'tty-prompt'
require 'pry'
require 'colorize'
require 'catpix'
require 'tty-box'

class User < ActiveRecord::Base
    has_many :user_skill_sets
    has_one :skill_set, through: :user_skill_sets
    has_many :user_houses
    has_many :houses, through: :user_houses

    def self.login
        prompt = TTY::Prompt.new
        name = prompt.ask("Please login.  What is your character's first name?".colorize(:light_yellow))
        password = prompt.mask("What is your password?".colorize(:light_yellow))
        gender = prompt.ask("Are you a Boy or a Girl?".colorize(:light_yellow))
        User.find_or_create_by(name: name, password: password, gender: gender)
    end


    def self.who_am_i
        puts "Your character name is #{User.last.name} Stark of House Stark".colorize(:light_blue)
    end
end