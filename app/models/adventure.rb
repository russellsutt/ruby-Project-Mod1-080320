require 'pry'
require 'tty-prompt'

class Adventure < ActiveRecord::Base
    belongs_to :house
    has_many :items

    def self.start
        #prompt with greeting and for them to pick something
        puts "Great lets go on an adventure. It is winter so beware of the cold!"
        prompt = TTY::Prompt.new
        selection = prompt.select("Where do you want to explore?") do |menu|
            menu.choice name: "The Crypt of Winterfell", value: 1
            menu.choice name: "The Castle Towers", value: 2
            menu.choice name: "Godswood of Winterfell", value: 3 #forest ??
        end
        #conditionals for 1,2,3

        if selection == 1
            #method for crypt
            Adventure.explore_crypt
        elsif selection == 2
            #method for tower
        else selection == 3
            #method for winterfell
        end
    end

    def self.explore_crypt
        puts "Welcome to the Crypt of Winterfell! It is dark you will need to find a torch to light"
        prompt = TTY::Prompt.new
        selection = prompt.select("Where do you want to look?") do |menu|
            menu.choice name: "Next to the tomb of Lord Rickard Stark", value: 1
            menu.choice name: "Behind the sprial steps", value: 2
        end
        if selection == 1
            puts "Nothing there, just some spiders"
            explore_crypt #need to find torch
        elsif selection == 2
            puts "Ah-ha! There is the torch, now we have light!"
        end
        binding.pry
    end




end