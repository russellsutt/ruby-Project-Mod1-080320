require 'tty-prompt'
require 'pry'
require 'colorize'

class Library < ActiveRecord::Base
    belongs_to :house



    def self.library_menu
        prompt = TTY::Prompt.new
        puts "Welcome to the Winterfell Library."
        player_selection = prompt.select("What would you like to do?") do |menu|
            menu.choice name: "Learn about other houses.", value: 1
            menu.choice name: "Go back.", value: 2
        end
        if player_selection == 1
            self.archives
        else
            House.first.welcome_home
        end
    end
            
    def self.archives
        prompt = TTY::Prompt.new
        puts "Welcome to the Winterfell Library"
        player_selection = prompt.select("Which house would you like to study") do |menu|
            menu.choice name: "House Stark of Winterfell", value: 1
            menu.choice name: "House Targaryen of Dragonstone", value: 2
            menu.choice name: "House Lannister of Casterly Rock", value: 3
            menu.choice name: "House Nymeros Martell of Sunspear", value: 4
            menu.choice name: "Go Back.", value: 5
        end
        if player_selection == 1
            self.starks
        elsif player_selection == 2
            self.targaryen
        elsif player_selection == 3
            self.lannister
        elsif player_selection == 4
            self.martell
        else player_selection == 5
            library_menu
        end
    end

    def self.starks
        prompt = TTY::Prompt.new
        stark_selection = prompt.select("What would you like to know about House Stark?") do |menu|
            menu.choice name: "Famous Members", value: 1
            menu.choice name: "Words", value: 2
            menu.choice name: "Coat of Arms", value: 3
            menu.choice name: "Region", value: 4
            menu.choice name: "Founded", value: 5
            menu.choice name: "Go Back.", value: 6
        end
        if stark_selection == 1
            puts "Eddard Stark, Catelyn Stark, Robb Stark, Sansa Stark, Arya Stark, Brandon Stark, Lyanna Stark, Jon Snow"
            sleep(2)
            starks
        elsif stark_selection == 2
            puts House.first.words
            sleep(2)
            starks
        elsif stark_selection == 3
            puts House.first.coat_of_arms
            sleep(2)
            starks
        elsif stark_selection == 4
            puts House.first.region
            sleep(2)
            starks
        elsif stark_selection == 5
            puts House.first.founded
            sleep(2)
            starks
        else stark_selection == 6
            archives
        end
    end

    def self.targaryen
        prompt = TTY::Prompt.new
        tar_selection = prompt.select("What would you like to know about House Targaryen?") do |menu|
            menu.choice name: "Famous Members", value: 1
            menu.choice name: "Words", value: 2
            menu.choice name: "Coat of Arms", value: 3
            menu.choice name: "Region", value: 4
            menu.choice name: "Founded", value: 5
            menu.choice name: "Go Back.", value: 6
        end
        if tar_selection == 1
            puts "Daenerys Targaryen, Aerys II Targaryen, Viserys II Targaryen, Rhaegar Targaryen, Lyanna Stark, Jon Snow"
            sleep(2)
            targaryen
        elsif tar_selection == 2
            puts House.second.words
            sleep(2)
            targaryen
        elsif tar_selection == 3
            puts House.second.coat_of_arms
            sleep(2)
            targaryen
        elsif tar_selection == 4
            puts House.second.region
            sleep(2)
            targaryen
        elsif tar_selection == 5
            puts House.second.founded
            sleep(2)
            targaryen
        else tar_selection == 6
            archives
        end
    end
    def self.lannister
        prompt = TTY::Prompt.new
        lannister_selection = prompt.select("What would you like to know about House Lannister?") do |menu|
            menu.choice name: "Famous Members", value: 1
            menu.choice name: "Words", value: 2
            menu.choice name: "Coat of Arms", value: 3
            menu.choice name: "Region", value: 4
            menu.choice name: "Founded", value: 5
            menu.choice name: "Go Back.", value: 6
        end
        if lannister_selection == 1
            puts "Tywen Lannister, Tyrion Lannister, Cersei Lannister, Jamie Lannister, Joffrey Lannist, Tommen Lannister"
            sleep(2)
            lannister
        elsif lannister_selection == 2
            puts House.third.words
            sleep(2)
            lannister
        elsif lannister_selection == 3
            puts House.third.coat_of_arms
            sleep(2)
            lannister
        elsif lannister_selection == 4
            puts House.third.region
            sleep(2)
            lannister
        elsif lannister_selection == 5
            puts House.third.founded
            sleep(2)
            lannister
        else lannister_selection == 6
            archives
        end
    end
    def self.martell
        prompt = TTY::Prompt.new
        martell_selection = prompt.select("What would you like to know about House Stark?") do |menu|
            menu.choice name: "Famous Members", value: 1
            menu.choice name: "Words", value: 2
            menu.choice name: "Coat of Arms", value: 3
            menu.choice name: "Region", value: 4
            menu.choice name: "Founded", value: 5
            menu.choice name: "Go Back.", value: 6
        end
        if martell_selection == 1
            puts "Oberyn Martell, Prince Doran Martel, Elia Martel, Ellaria Sand"
            sleep(2)
            martell
        elsif martell_selection == 2
            puts House.fourth.words
            sleep(2)
            martell
        elsif martell_selection == 3
            puts House.fourth.coat_of_arms
            sleep(2)
            martell
        elsif martell_selection == 4
            puts House.fourth.region
            sleep(2)
            martell
        elsif martell_selection == 5
            puts House.fourth.founded
            sleep(2)
            martell
        else martell_selection == 6
            archives
        end
    end
end