require 'pry'
require 'tty-prompt'

class Adventure < ActiveRecord::Base
    belongs_to :house
    has_many :items

    def self.start
        #prompt with greeting and for them to pick something
        puts "Great lets go on an adventure! It is winter so beware of the cold..."
        prompt = TTY::Prompt.new
        selection = prompt.select("Where do you want to explore?") do |menu|
            menu.choice name: "The Crypt of Winterfell", value: 1
            menu.choice name: "The Castle Towers", value: 2
            menu.choice name: "Godswood of Winterfell", value: 3 #forest ??
        end
        #conditionals for 1,2,3

        if selection == 1
            #method for crypt
            puts "Welcome to the Crypt of Winterfell! It is dark you will need to find a torch to light"
            sleep (2)
            Adventure.find_torch
        elsif selection == 2
            #method for tower
        else selection == 3
            #method for winterfell
        end
    end

    def self.find_torch
        prompt = TTY::Prompt.new
        selection = prompt.select("Where do you want to look?") do |menu|
            menu.choice name: "Next to the tomb of Lord Rickard Stark", value: 1
            menu.choice name: "Behind the sprial steps", value: 2
        end
        if selection == 1
            puts "Nothing there, just some spiders"
            sleep (2)
            find_torch #rerun to find torch
        elsif selection == 2
            puts "Ah-ha! There is the torch, now we have light!"
            sleep (2)
            Adventure.arya_option
        end
    end

    def self.arya_option
        puts "What is that sound? Look it's Arya, she wants to play hide and seek!"
        prompt = TTY::Prompt.new
        selection = prompt.select("Do you want to play?") do |menu|
            menu.choice name: "yes", value: 1
            menu.choice name: "no", value: 2
        end
        if selection == 1
            puts "Arya says if you find her you'll get a prize!"
            sleep(2)
            puts "Let's go!"
            sleep (2)
            Adventure.find_arya
        elsif selection == 1
            #make one last misson
            #option to exit ?
        end
    end

    def self.find_arya
        ##lower fatigue skill by 1
        prompt = TTY::Prompt.new
        selection = prompt.select("Where could Arya be?") do |menu|
            menu.choice name: "Behind the pillar", value: 1
            menu.choice name: "Behind the tomb of Lyanna Stark", value: 2
            menu.choice name: "Behind the ironwood door", value: 3
        end
        if selection == 1
            puts "She is not there!"
            sleep (2)
            find_arya #rerun to find arya
        elsif selection == 2
            puts "No one is there!"
            sleep (2)
            find_arya #rerun to find arya
        elsif selection == 3
            puts "Hey! You found me, nice job. Here is a silver stag."
            ##give this item to user
            sleep (2)
        end
    end

    def play_with_ghost_option
        puts "Look there is Ghost, Jon's direwolf. Jon must be close by!"
        prompt = TTY::Prompt.new
        selection = prompt.select("Do you want to play?") do |menu|
            menu.choice name: "yes", value: 1
            menu.choice name: "no, return to castle", value: 2
        end
    end


end