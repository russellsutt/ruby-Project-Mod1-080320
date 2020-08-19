require 'tty-prompt'
require 'pry'
require 'colorize'


class Room < ActiveRecord::Base
    belongs_to :house
    belongs_to :user

    def self.change_clothes
        prompt = TTY::Prompt.new
        clothes_selection = prompt.select("What would you like to wear?") do |menu|
            menu.choice name: "Change into armor.", value: 1
            menu.choice name: "Everyday wear.", value: 2
            menu.choice name: "Fancy wear.", value: 3
            menu.choice name: "Back to room.", value: 4
        end
        if clothes_selection == 1
            puts "You are now ready for battle!"
            change_clothes
        elsif clothes_selection == 2
            puts "Just a normal day, eh?"
            change_clothes
        elsif clothes_selection == 3
            puts  "Oh you fancy!"
            change_clothes
        else
            self.user_room
        end
    end

    def self.user_room
        prompt = TTY::Prompt.new
        puts "Welcome to your room in Winterfell."
        selection = prompt.select("What would you like to do?") do |menu|
            menu.choice name: "Change clothes.", value: 1
            menu.choice name: "Rest", value: 2, disabled: "(Not built)"
            menu.choice name: "Store item.", value: 3, disabled: "(Not built)"
            menu.choice name: "Go back to Main Hall.", value: 4
        end
        if selection == 1
            self.change_clothes
        elsif selection == 2
            User.last.user_skill_set.skill_set_id.update(fatigue: 0)
            puts "Sleep well."
            sleep(3)
            self.user_room
        elsif selection == 3
            self.user_room
        else
            House.first.welcome_home
        end
    end
end