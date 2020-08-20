require 'tty-prompt'
require 'pry'
require 'colorize'
require 'tty-box'
require 'catpix'

class Library < ActiveRecord::Base
    belongs_to :house



    def self.library_menu
        Catpixel.catpix_high('assets/images/stark/library-01.png')
        # UserLibrary.last.user.user_skill_sets.last.skill_set.update(intelligence: += 1)
        box = TTY::Box.frame(width: 30, height: 8, align: :center, border: :thick, padding: 2) do "Welcome to the Winterfell Library." end
        puts box.colorize(:light_green)
        prompt = TTY::Prompt.new
        player_selection = prompt.select("What would you like to do?") do |menu|
            menu.choice name: "Learn about other houses.", value: 1
            menu.choice name: "Go back.".colorize(:light_green), value: 2
        end
        if player_selection == 1
            self.archives
        else
            House.first.welcome_home
        end
    end
            
    def self.archives
        prompt = TTY::Prompt.new
        player_selection = prompt.select("Which house would you like to study") do |menu|
            menu.choice name: "House Stark of Winterfell".colorize(:light_blue), value: 1
            menu.choice name: "House Targaryen of Dragonstone".colorize(:red), value: 2
            menu.choice name: "House Lannister of Casterly Rock".colorize(:light_red), value: 3
            menu.choice name: "House Nymeros Martell of Sunspear".colorize(:light_yellow), value: 4
            menu.choice name: "Go Back.".colorize(:light_green), value: 5
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
        stark_selection = prompt.select("What would you like to know about House Stark?".colorize(:light_blue)) do |menu|
            menu.choice name: "Famous Members".colorize(:light_blue), value: 1
            menu.choice name: "Words".colorize(:light_blue), value: 2
            menu.choice name: "Coat of Arms".colorize(:light_blue), value: 3
            menu.choice name: "Region".colorize(:light_blue), value: 4
            menu.choice name: "Founded".colorize(:light_blue), value: 5
            menu.choice name: "Go Back.".colorize(:light_green), value: 6
        end
        if stark_selection == 1
            Catpixel.catpix_high('assets/images/stark/stark-family-01.jpg')
            puts "Eddard Stark, Catelyn Stark, Robb Stark, Sansa Stark, Arya Stark, Brandon Stark, Lyanna Stark, Jon Snow".colorize(:light_blue)
            sleep(2)
            starks
        elsif stark_selection == 2
            puts House.first.words.colorize(:light_blue)
            sleep(2)
            starks
        elsif stark_selection == 3
            Catpixel.catpix_high('assets/images/stark/Stark.png')
            puts House.first.coat_of_arms.colorize(:light_blue)
            sleep(2)
            starks
        elsif stark_selection == 4
            puts House.first.region.colorize(:light_blue)
            sleep(2)
            starks
        elsif stark_selection == 5
            puts House.first.founded.colorize(:light_blue)
            sleep(2)
            starks
        else stark_selection == 6
            archives
        end
    end

    def self.targaryen
        prompt = TTY::Prompt.new
        tar_selection = prompt.select("What would you like to know about House Targaryen?".colorize(:red)) do |menu|
            menu.choice name: "Famous Members".colorize(:red), value: 1
            menu.choice name: "Words".colorize(:red), value: 2
            menu.choice name: "Coat of Arms".colorize(:red), value: 3
            menu.choice name: "Region".colorize(:red), value: 4
            menu.choice name: "Founded".colorize(:red), value: 5
            menu.choice name: "Go Back.".colorize(:light_green), value: 6
        end
        if tar_selection == 1
            Catpixel.catpix_high('assets/images/targaryen/danny-01.jpeg')
            puts "Daenerys Targaryen, Aerys II Targaryen, Viserys II Targaryen, Rhaegar Targaryen, Lyanna Stark, Jon Snow".colorize(:red)
            sleep(2)
            targaryen
        elsif tar_selection == 2
            puts House.second.words.colorize(:red)
            sleep(2)
            targaryen
        elsif tar_selection == 3
            Catpixel.catpix_high('assets/images/targaryen/1200px-Coat_of_arms_of_House_Targaryen_of_Dragonstone.jpg')
            puts House.second.coat_of_arms.colorize(:red)
            sleep(2)
            targaryen
        elsif tar_selection == 4
            puts House.second.region.colorize(:red)
            sleep(2)
            targaryen
        elsif tar_selection == 5
            puts House.second.founded.colorize(:red)
            sleep(2)
            targaryen
        else tar_selection == 6
            archives
        end
    end
    def self.lannister
        prompt = TTY::Prompt.new
        lannister_selection = prompt.select("What would you like to know about House Lannister?".colorize(:light_red)) do |menu|
            menu.choice name: "Famous Members".colorize(:light_red), value: 1
            menu.choice name: "Words".colorize(:light_red), value: 2
            menu.choice name: "Coat of Arms".colorize(:light_red), value: 3
            menu.choice name: "Region".colorize(:light_red), value: 4
            menu.choice name: "Founded".colorize(:light_red), value: 5
            menu.choice name: "Go Back.".colorize(:light_green), value: 6
        end
        if lannister_selection == 1
            Catpixel.catpix_high('assets/images/lannister/tyrion-01.jpeg')
            puts "Tywen Lannister, Tyrion Lannister, Cersei Lannister, Jamie Lannister, Joffrey Lannist, Tommen Lannister".colorize(:light_red)
            sleep(2)
            lannister
        elsif lannister_selection == 2
            puts House.third.words.colorize(:light_red)
            sleep(2)
            lannister
        elsif lannister_selection == 3
            Catpixel.catpix_high('assets/images/lannister/545px-House_Lannister.jpg')
            puts House.third.coat_of_arms.colorize(:light_red)
            sleep(2)
            lannister
        elsif lannister_selection == 4
            puts House.third.region.colorize(:light_red)
            sleep(2)
            lannister
        elsif lannister_selection == 5
            puts House.third.founded.colorize(:light_red)
            sleep(2)
            lannister
        else lannister_selection == 6
            archives
        end
    end
    def self.martell
        prompt = TTY::Prompt.new
        martell_selection = prompt.select("What would you like to know about House Martell".colorize(:light_yellow)) do |menu|
            menu.choice name: "Famous Members".colorize(:light_yellow), value: 1
            menu.choice name: "Words".colorize(:light_yellow), value: 2
            menu.choice name: "Coat of Arms".colorize(:light_yellow), value: 3
            menu.choice name: "Region".colorize(:light_yellow), value: 4
            menu.choice name: "Founded".colorize(:light_yellow), value: 5
            menu.choice name: "Go Back.".colorize(:light_green), value: 6
        end
        if martell_selection == 1
            Catpixel.catpix_high('assets/images/martell/oberyn-01.jpg')
            puts "Oberyn Martell, Prince Doran Martel, Elia Martel, Ellaria Sand".colorize(:light_yellow)
            sleep(2)
            martell
        elsif martell_selection == 2
            puts House.fourth.words.colorize(:light_yellow)
            sleep(2)
            martell
        elsif martell_selection == 3
            Catpixel.catpix_high('assets/images/martell/120px-House_Martell.jpg')
            puts House.fourth.coat_of_arms.colorize(:light_yellow)
            sleep(2)
            martell
        elsif martell_selection == 4
            puts House.fourth.region.colorize(:light_yellow)
            sleep(2)
            martell
        elsif martell_selection == 5
            puts House.fourth.founded.colorize(:light_yellow)
            sleep(2)
            martell
        else martell_selection == 6
            archives
        end
    end
end