require 'tty-prompt'
require 'pry'
require 'tty-box'

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

    def create_skill_set
        if self.user_skill_sets.empty? 
            UserSkillSet.create(user: self, skill_set: SkillSet.create)
        end
    end

    def skill_training
        prompt = TTY::Prompt.new
            player_selection = prompt.select("What skill would you like to practice?".colorize(:light_blue)) do |menu|
                menu.choice name: "Sword Fighting".colorize(:light_blue), value: 1
                menu.choice name: "Archery".colorize(:light_blue), value: 2
                menu.choice name: "Horse Riding".colorize(:light_blue), value: 3
                menu.choice name: "Survival".colorize(:light_blue), value: 4
                menu.choice name: "Go Back".colorize(:light_yellow), value: 5
            end  
            user_skills = self.user_skill_sets.last.skill_set
            if player_selection == 1
                user_skills.sword_fighting += 1
                box = TTY::Box.success ("Your sword fighting skill is now #{user_skills.sword_fighting}!")
                puts box
                sleep (2)
                user_skills.save
                self.skill_training
            elsif player_selection == 2 
                user_skills.archery += 1
                box = TTY::Box.success ("Your archery skill is now #{user_skills.archery}")
                puts box
                sleep (2)
                user_skills.save
                self.skill_training
            elsif player_selection == 3
                user_skills.horse_riding += 1
                box = TTY::Box.success ("Your horse riding skill is now #{user_skills.horse_riding}!")
                puts box
                sleep (2)
                user_skills.save
                self.skill_training
            elsif player_selection == 4
                user_skills.survival_skills += 1
                box = TTY::Box.success ("Your survival skill is now #{user_skills.survival_skills}!")
                puts box
                sleep (2)
                user_skills.save
                self.skill_training
            elsif player_selection == 5
                House.welcome_home
            end     
    end
end