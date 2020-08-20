require 'tty-prompt'
require 'pry'
require 'colorize'


class Room < ActiveRecord::Base
    belongs_to :house
    has_many :user_rooms
    has_many :users, through: :user_rooms

    def self.change_clothes
        prompt = TTY::Prompt.new
        clothes_selection = prompt.select("What would you like to wear?") do |menu|
            menu.choice name: "Change into armor.".colorize(:blue), value: 1
            menu.choice name: "Everyday wear.".colorize(:yellow), value: 2
            menu.choice name: "Fancy wear.".colorize(:red), value: 3
            menu.choice name: "Back to room.", value: 4
        end
        if clothes_selection == 1
            box = TTY::Box.info ("You are now ready for battle!")
            puts box
            sleep(3)
            change_clothes
        elsif clothes_selection == 2
            box = TTY::Box.info ("Just a normal day, eh?")
            puts box
            sleep(3)
            change_clothes
        elsif clothes_selection == 3
            box = TTY::Box.info ("Oh you fancy!")
            puts box
            sleep(3)
            change_clothes
        else
            self.user_room
        end
    end
    def self.user_room
        Catpixel.catpix_high('assets/images/stark/room-01.jpg')
        prompt = TTY::Prompt.new
        box = TTY::Box.frame(width: 30, height: 8, align: :center, border: :thick, padding: 2) do "Welcome to your room in Winterfell!" end
        puts box.colorize(:light_blue)
        selection = prompt.select("What would you like to do?".colorize(:light_blue)) do |menu|
            menu.choice name: "Change clothes.".colorize(:light_blue), value: 1
            menu.choice name: "Rest".colorize(:light_blue), value: 2
            menu.choice name: "Store item.".colorize(:light_blue), value: 3, disabled: "(Not built)"
            menu.choice name: "Go back.".colorize(:light_green), value: 4
        end
        if selection == 1
            self.change_clothes
        elsif selection == 2
            UserRoom.last.user.user_skill_sets.last.skill_set.update(fatigue: 0)
            box = TTY::Box.info ("Your fatigue is now 0! Sleep well....")
            puts box
            sleep(3)
            self.user_room
        elsif selection == 3
            self.user_room
        else
            House.first.welcome_home
        end
    end
end