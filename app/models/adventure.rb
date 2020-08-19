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
            menu.choice name: "Godswood of Winterfell", value: 2 #forest ??
            menu.choice name: "The Castle Towers", value: 3
        end
        #conditionals for 1,2,3

        if selection == 1
            #method for crypt
            puts "Welcome to the Crypt of Winterfell! It is dark you will need to find a torch to light."
            sleep (2)
            Adventure.find_torch
        elsif selection == 2
            #method for godswood
            puts "Welcome to the Godswood of Winterfell! Be careful, who knows what you will stumble upon here."
            sleep (2)
            Adventure.ghost_option
        else selection == 3
            #method for tower
        end
    end


#GODSWOOD METHODS BELOW
def self.ghost_option
    puts "Look there is Ghost, Jon's direwolf. Jon must be close by!"
    prompt = TTY::Prompt.new
    selection = prompt.select("Do you want to play with Ghost?") do |menu|
        menu.choice name: "yes", value: 1
        menu.choice name: "no, return to Godswood", value: 2
    end
    if selection == 1
        puts "Remember Ghost is very shy!"
        sleep(2)
        Adventure.play_with_ghost
    elsif selection == 2
        #return to castle or main adventure screen
    end
end

def self.play_with_ghost
    prompt = TTY::Prompt.new
    selection = prompt.select("Ghost looks hungy!") do |menu|
        menu.choice name: "Feed Ghost some of your leftover pie", value: 1
        menu.choice name: "Pet Ghost", value: 2
        menu.choice name: "Leave Ghose alone, return to castle", value: 3
    end
    if selection == 1
        puts "Wow, he ate that fast. He must of been hungry!"
        sleep (2)
        Adventure.jon_option
        #return to castle or main adventure screen
    elsif selection == 2
        puts "Ghost did not like that! He must be tired, maybe we should leave him alone"
        sleep (2)
        play_with_ghost
    elsif selection ==3
        #return to castle or main adventure screen
    end
end

    def self.jon_option
        puts "There is Jon practicing sword fighting!"
        prompt = TTY::Prompt.new
        selection = prompt.select("Do you want to practice with Jon?") do |menu|
            menu.choice name: "yes", value: 1
            menu.choice name: "no", value: 2
        end
        if selection == 1
            # hey player's name, warning I am not going to go easy on you or somthing like that
            puts "Get ready..."
            sleep(2)
            Adventure.practice_with_jon
        elsif selection == 2
            #have another option here?
            #return to castle or main adventure screen
        end
    end

    def self.practice_with_jon
        ##on guard greetting?
        ##lower fatigue skill by 1
        ##raise sword fighting skill by 1
        prompt = TTY::Prompt.new
        selection = prompt.select("Pick your move") do |menu|
            menu.choice name: "Lunge", value: 1
            menu.choice name: "Attack", value: 2
            menu.choice name: "Roll", value: 3
            menu.choice name: "Guard", value: 4
        end
        #create an array? that user sequence must contain those moves to win?
        if selection == 1
        elsif selection == 2
        elsif selection == 3
        elsif selection == 4
        end 
    end

 #CRYPT METHODS BELOW   
    def self.find_torch
        #survival skills up 1
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
            #have another option here?
            #return to castle or main adventure screen
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
            puts "Hey! You found me, nice job. But you must first answer this question to get the prize."
            ##build another method => answer secret question if right give this item to user
            sleep (2)
        end
    end

end