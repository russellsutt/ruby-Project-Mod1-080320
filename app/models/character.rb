require 'tty-prompt'
require 'pry'
require 'colorize'

class Character < ActiveRecord::Base
    has_many :houses

    def self.talk_to_family
        prompt = TTY::Prompt.new
        player_selection = prompt.select("Who would you like to speak with?") do |menu|
            menu.choice name: Character.first.name, value: 1
            menu.choice name: Character.second.name, value: 2
            menu.choice name: Character.third.name, value: 3
            menu.choice name: Character.second_to_last.name, value: 4
            menu.choice name: Character.last.name, value: 5
            menu.choice name: "I'm done talking.", value: 6
        end
        sleep(1)
        if player_selection == 1
            puts "I am #{Character.first.name}, #{Character.first.titles} of Winterfell. Let me give you some adivce: #{Character.first.quote}"
            sleep(1)
            talk_to_family
        elsif player_selection == 2
            puts "I am #{Character.second.name}, #{Character.second.titles} of Winterfell. Us Starks need to stick together. #{Character.second.quote}"
            sleep(1)
            talk_to_family
        elsif player_selection == 3
            puts "I am #{Character.third.name}, #{Character.third.titles}.  #{User.last.name}, always be honorable. #{Character.third.quote}"
            sleep(1)
            talk_to_family
        elsif player_selection == 4
            puts "I am #{Character.second_to_last.name}, #{Character.second_to_last.titles}. #{User.last.name}, #{Character.second_to_last.quote}"
            sleep(1)
            talk_to_family
        elsif player_selection == 5
            puts "I am #{Character.last.name}, #{Character.last.titles}. #{User.last.name}, always be kind to others. #{Character.last.quote}"
            sleep(1)
            talk_to_family
        else player_selection == 6
            sleep(1)
            House.first.welcome_home
        end
    end
end