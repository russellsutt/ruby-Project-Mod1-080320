require 'pry'
require 'tty-prompt'
require 'colorize'

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
            menu.choice name: "The Castle Towers", value: 3 #not built out, if time?
            menu.choice name: "Go back to castle", value: 4 #not built out, if time?
        end
        #conditionals for 1,2,3

        if selection == 1
            #method for crypt
            puts "Welcome to the Crypt of Winterfell! It is dark you will need to find a torch to light."
            sleep (2)
            Adventure.find_torch
        elsif selection == 2
            #method for godswood
            puts "Welcome to the Godswood of Winterfell! Who knows what you will stumble upon here."
            sleep (2)
            Adventure.ghost_option
        elsif selection == 3
            #method for tower
            puts "Sorry, not available."
            sleep (2)
            Adventure.start
        elsif selection == 4
            #go back to castle method
        end
    end


#GODSWOOD METHODS BELOW
def self.ghost_option
    puts "Look there is Ghost, Jon's direwolf. Jon must be close by!"
    prompt = TTY::Prompt.new
    selection = prompt.select("Do you want to play with Ghost?") do |menu|
        menu.choice name: "yes", value: 1
        menu.choice name: "no, go back to adventures.", value: 2
    end
    if selection == 1
        puts "Remember Ghost is very shy!"
        sleep(2)
        Adventure.play_with_ghost
    elsif selection == 2
        #return to adventure screen
        Adventure.start
    end
end

def self.play_with_ghost
    prompt = TTY::Prompt.new
    selection = prompt.select("Ghost looks hungy!") do |menu|
        menu.choice name: "Feed Ghost some of your leftover pie", value: 1
        menu.choice name: "Pet Ghost", value: 2
        menu.choice name: "Leave Ghose alone, return to adventures", value: 3
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
        Adventure.start
    end
end

    def self.jon_option
        puts "There is Jon practicing sword fighting!"
        prompt = TTY::Prompt.new
        selection = prompt.select("Do you want to practice with Jon?") do |menu|
            menu.choice name: "yes", value: 1
            menu.choice name: "no, go back to adventures", value: 2
        end
        if selection == 1
            # hey player's name, warning I am not going to go easy on you or somthing like that
            puts "Get ready..."
            sleep(2)
            Adventure.practice_with_jon
        elsif selection == 2
            #have another option here?
            #return to castle or main adventure screen
            Adventure.start
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
            menu.choice name: "Claim defeat", value: 5
        end
        #create an array? that user sequence must contain those moves to win?
        # return random sayings from Jon ?
        if selection == 1
            puts "John says, nice try!"
            sleep (2)
            practice_with_jon #to rerun jon method
        elsif selection == 2
            puts "Wow, I did not see that coming. Great job!"
            sleep(2)
            Adventure.item_from_jon#method here for jon to give user item
        elsif selection == 3
            puts "John says, you almost got me!"
            sleep (2)
            practice_with_jon #to rerun jon method
        elsif selection == 4
            puts "John says, nice block. I'm impressed!"
            sleep (2)
            practice_with_jon #to rerun jon method
        elsif selection == 5
            puts "That is too bad. Come back anytime." #or something like that
            Adventure.start
        end 
    end

    def self.item_from_jon
        puts "A great fighter needs a great sword. Here take my extra sword"
        sleep (2)
        #method to add sword item to user's item
        Adventure.visit_heart_tree_option
    end

    def self.visit_heart_tree_option
        puts "Wow there is the heart tree!"
        prompt = TTY::Prompt.new
        selection = prompt.select("Do you want to visit the tree?") do |menu|
            menu.choice name: "yes", value: 1
            menu.choice name: "no, go back to adventures", value: 2
        end
        if selection == 1
            Adventure.interact_with_heart_tree
        elsif selection == 2
             #return to castle or main adventure screen
             Adventure.start
        end
    end

    def self.interact_with_heart_tree
        prompt = TTY::Prompt.new
        selection = prompt.select("What do you want to do?") do |menu|
            menu.choice name: "Ask the heart tree for advice?", value: 1
            menu.choice name: "Take a nap under the heart tree?", value: 2
            menu.choice name: "Go back to adventures.", value: 3
        end
        if selection == 1
            Adventure.talk_to_tree
        elsif selection == 2
            #some kind of sleep greeting etc.
            sleep (5) #longer sleep feature because you are napping??
            ##lower fatigue skill
            ##show skills
        elsif selection == 3
            Adventure.start
        end
    end

    def self.talk_to_tree
        #return random advice

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
            menu.choice name: "no, go back to adventures", value: 2
        end
        if selection == 1
            puts "Arya says if you find her you'll get a prize!"
            sleep(2)
            puts "Let's go!"
            sleep (2)
            Adventure.find_arya
        elsif selection == 2
            #have another option here?
            #return to castle or main adventure screen
            Adventure.start
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
            puts "Hey! You found me, nice job. But that was too easy. You must first answer my question to get the prize."
            Adventure.arya_question##build another method => answer secret question if right give this item to user
            sleep (2)
        end
    end

    def self.arya_question
        prompt = TTY::Prompt.new
        question_array = [
            #question_array.sample[:question] to get random question back
            #get quesions related to 
            {"question": "Was Brandon Stark the first Stark?", "answer": "yes"},
            {"question": "Are there any Stark swords in the Iron Throne?", "answer": "no"}
        ]
        chosen_question = question_array.sample[:question]
        selection = prompt.select(chosen_question) do |menu|
            prompt = TTY::Prompt.new
            menu.choice name: "yes", value: 1
            menu.choice name: "no", value: 2
        end
        if chosen_question == question_array.first[:question] && selection == 1
            #Correct!
            ##store item with user
            puts "That is correct! Here is a golden dragon."
        elsif chosen_question == question_array.second[:question] && selection == 2
            #Correct!
            ##store item with user
            puts "That is correct! Here is a golden dragon."
        else
            puts "Sorry that is not correct."
            sleep (2)
            #try again method
            Adventure.question_try_again
        end

    end

    def self.question_try_again
        prompt = TTY::Prompt.new
        selection = prompt.select("Would you like to try again?") do |menu|
            prompt = TTY::Prompt.new
            menu.choice name: "yes", value: 1
            menu.choice name: "no, go back to adventures", value: 2
        end
        if selection == 1
            Adventure.arya_question #to recall question method
        elsif selection == 2
            #exit to castle or adventure home screen??
            Adventure.start
        end
    end

end