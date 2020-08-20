require 'pry'
require 'tty-prompt'
require 'tty-box'
require 'colorize'
require 'rmagick'
require 'catpix'

# require_relative '../assets/image/adventure'

class Adventure < ActiveRecord::Base
    belongs_to :house
    has_many :items
    has_many :user_adventures
    has_many :users, through: :user_adventures

    def start_winterfell_adventure 
        puts "Great lets go on an adventure! It's winter so beware of the cold...".colorize(:light_blue)
        prompt = TTY::Prompt.new
        selection = prompt.select("#{UserAdventure.last.user.name}, where do you want to explore?".colorize(:light_blue)) do |menu|
            menu.choice name: "The Crypt of Winterfell".colorize(:light_blue), value: 1
            menu.choice name: "Godswood of Winterfell".colorize(:light_blue), value: 2
            menu.choice name: "The Castle Towers".colorize(:light_red), value: 3, disabled: "(Off limits, the guards are there.)"
            menu.choice name: "Go Back".colorize(:light_yellow), value: 4 
        end
        #conditionals for 1,2,3

        if selection == 1
            #method for crypt
            box = TTY::Box.frame(width: 30, height: 10, align: :center, border: :thick, padding: 2) do
                Catpixel.catpix_high("assets/image/adventure/crypt.jpg")
                "Welcome to the Crypt of Winterfell! It is dark you will need to find a torch to light."
            end
            puts box.colorize(:light_blue)
            sleep (2)
            self.find_torch
        elsif selection == 2
            #method for godswood
            box = TTY::Box.frame(width: 30, height: 10, align: :center, border: :thick, padding: 2) do
                "Welcome to the Godswood of Winterfell! Who knows what you will stumble upon here.".colorize(:light_blue)
            end
            puts box.colorize(:light_blue)
            sleep (2)
            self.ghost_option
        elsif selection == 3
            #method for tower not available yet
            self.start_winterfell_adventure 
        elsif selection == 4
            #go back to house method
            House.first.welcome_home
        end
    end

    #Skill methods
    def raise_fatigue_skill
        user_skills = UserAdventure.last.user.user_skill_sets.last.skill_set
        user_skills.fatigue += 1
        user_skills.save
        box = TTY::Box.error ("Oh no, your fatigue skill is now #{user_skills.fatigue}!")
        puts box
        sleep (2)
    end

    def raise_intelligence_skill
        user_skills = UserAdventure.last.user.user_skill_sets.last.skill_set
        user_skills.intelligence += 1
        user_skills.save
        box = TTY::Box.success ("Your intelligence skill is now #{user_skills.intelligence}!")
        puts box
        sleep (2)
    end

    def raise_sword_fighting_skill
        user_skills = UserAdventure.last.user.user_skill_sets.last.skill_set
        user_skills.sword_fighting += 1
        user_skills.save
        box = TTY::Box.success ("Your sword fighting skill is now #{user_skills.sword_fighting}!")
        puts box
        sleep (2)
    end

    def raise_survival_skill
        user_skills = UserAdventure.last.user.user_skill_sets.last.skill_set
        user_skills.survival_skills += 1
        user_skills.save
        box = TTY::Box.success("Your survival skill is now #{user_skills.survival_skills}!")
        puts box
        sleep(2)
    end

    def lower_fatigue_skill
        user_skills = UserAdventure.last.user.user_skill_sets.last.skill_set
        user_skills.fatigue -= 1
        user_skills.save
        box = TTY::Box.success("You must of slept well! Your fatigue skill is now #{user_skills.fatigue}.")
        puts box
        sleep (2)
    end

    #GODSWOOD METHODS BELOW
    def ghost_option
        Catpixel.catpix_high("assets/image/adventure/ghost.jpg")
        puts "Look there is Ghost, Jon Snow's direwolf. Jon must be close by!".colorize(:light_blue)
        prompt = TTY::Prompt.new
        selection = prompt.select("Do you want to play with Ghost?".colorize(:light_blue)) do |menu|
            menu.choice name: "yes".colorize(:light_green), value: 1
            menu.choice name: "no, go back to adventures.".colorize(:yellow), value: 2
        end
        if selection == 1
            puts "Remember Ghost is very shy!".colorize(:light_blue)
            sleep(2)
            self.play_with_ghost
        elsif selection == 2
            #return to adventure screen
            self.start_winterfell_adventure 
        end
    end

    def play_with_ghost
        prompt = TTY::Prompt.new
        selection = prompt.select("Ghost looks hungy!".colorize(:light_blue)) do |menu|
            menu.choice name: "Feed Ghost some of your leftover pie.".colorize(:light_blue), value: 1
            menu.choice name: "Pet Ghost.".colorize(:light_blue), value: 2
            menu.choice name: "Leave Ghost alone, return to adventures.".colorize(:light_yellow), value: 3
        end
        if selection == 1
            puts "Wow, he ate that fast. He must of been hungry!".colorize(:light_green)
            puts "Let's go find Jon Snow now.".colorize(:light_blue)
            sleep (2)
            self.jon_option
            #return to castle or main adventure screen
        elsif selection == 2
            puts "Ghost did not like that! Maybe we should leave him alone.".colorize(:light_red)
            sleep (2)
            self.raise_fatigue_skill
            self.play_with_ghost
        elsif selection ==3
            #return to castle or main adventure screen
            self.start_winterfell_adventure 
        end
    end
    
    def jon_option
        Catpixel.catpix_high("assets/image/adventure/sword.jpg")
        puts "There he is practicing sword fighting!".colorize(:light_blue)
        prompt = TTY::Prompt.new
        selection = prompt.select("Do you want to challege Jon?".colorize(:light_red)) do |menu|
            menu.choice name: "yes".colorize(:light_green), value: 1
            menu.choice name: "no, go back to adventures".colorize(:light_yellow), value: 2
        end
        if selection == 1
            # hey player's name, warning I am not going to go easy on you or somthing like that
            puts "Hey #{UserAdventure.last.user.name}, fair warning I'm not going easy on you...".colorize(:light_red)
            sleep(2)
            self.practice_with_jon
        elsif selection == 2
            #have another option here?
            #return to castle or main adventure screen
            self.start_winterfell_adventure 
        end
    end

    def practice_with_jon
        ##on guard greetting?
        ##lower fatigue skill by 1
        ##raise sword fighting skill by 1
        prompt = TTY::Prompt.new
        selection = prompt.select("Pick your move".colorize(:light_red)) do |menu|
            menu.choice name: "Lunge".colorize(:light_red), value: 1
            menu.choice name: "Attack".colorize(:light_red), value: 2
            menu.choice name: "Roll".colorize(:light_red), value: 3
            menu.choice name: "Guard".colorize(:light_red), value: 4
            menu.choice name: "Claim defeat".colorize(:light_yellow), value: 5
        end
        #create an array? that user sequence must contain those moves to win?
        # return random sayings from Jon ?
        if selection == 1
            puts "Yikes you missed!".colorize(:light_red)
            sleep (2)
            self.raise_fatigue_skill
            self.practice_with_jon #to rerun jon method
        elsif selection == 2
            puts "Wow, I did not see that coming. Great job #{UserAdventure.last.user.name}!".colorize(:light_green)
            sleep(2)
            self.item_from_jon#method here for jon to give user item
        elsif selection == 3
            puts "You missed!".colorize(:light_red)
            sleep (2)
            self.raise_fatigue_skill
            self.practice_with_jon #to rerun jon method
        elsif selection == 4
            puts "John says, nice block!".colorize(:light_green)
            sleep (2)
            self.practice_with_jon #to rerun jon method
        elsif selection == 5
            puts "That is too bad. Come back anytime.".colorize(:light_blue) #or something like that
            self.start_winterfell_adventure 
        end 
    end

    def item_from_jon
        puts "A great fighter needs a great sword. Here take my spare.".colorize(:light_green)
        sleep (2)
        raise_sword_fighting_skill
        self.visit_heart_tree_option
    end

    def visit_heart_tree_option
        Catpixel.catpix_high("assets/image/adventure/tree.jpg")
        puts "Wow there is the heart tree!".colorize(:light_blue)
        prompt = TTY::Prompt.new
        selection = prompt.select("Do you want to visit the tree?".colorize(:light_blue)) do |menu|
            menu.choice name: "yes".colorize(:light_green), value: 1
            menu.choice name: "no, go back to adventures".colorize(:light_yellow), value: 2
        end
        if selection == 1
            self.interact_with_heart_tree
        elsif selection == 2
             #return to castle or main adventure screen
             self.start_winterfell_adventure 
        end
    end

    def interact_with_heart_tree
        prompt = TTY::Prompt.new
        selection = prompt.select("What do you want to do?".colorize(:light_blue)) do |menu|
            menu.choice name: "Ask the heart tree for advice?".colorize(:light_red), value: 1, disabled: "(The tree is sleeping. Shhhhh!)"
            menu.choice name: "Take a nap under the heart tree?".colorize(:light_blue), value: 2
            menu.choice name: "Go back to adventures.".colorize(:light_yellow), value: 3
        end
        if selection == 1
            self.talk_to_tree
        elsif selection == 2
            #some kind of sleep greeting etc.
            sleep (4) #longer sleep feature because you are napping??
            self.lower_fatigue_skill
            puts "It is getting dark. Time to head back!".colorize(:light_blue)
            sleep (2)
            self.start_winterfell_adventure
        elsif selection == 3
            self.start_winterfell_adventure 
        end
    end

    def talk_to_tree
        #return random advice
    end


    #CRYPT METHODS BELOW   
    def find_torch
        #survival skills up 1
        prompt = TTY::Prompt.new
        selection = prompt.select("Where do you want to look?".colorize(:light_blue)) do |menu|
            menu.choice name: "Next to the tomb of Lord Rickard Stark".colorize(:light_blue), value: 1
            menu.choice name: "Behind the sprial steps".colorize(:light_blue), value: 2
        end
        if selection == 1
            puts "Nothing there, just some spiders".colorize(:light_red)
            sleep (2)
            find_torch #rerun to find torch
        elsif selection == 2
            puts "Ah-ha! There is the torch, now we have light!".colorize(:light_green)
            sleep (2)
            self.raise_survival_skill
            # user_skills = UserAdventure.last.user.user_skill_sets.last.skill_set
            # user_skills.survival_skills += 1
            # puts "Your survival skill is now #{user_skills.survival_skills}!"
            self.arya_option
        end
    end

    def arya_option
        puts "What is that sound? Look it's Arya, she wants to play hide and seek!".colorize(:light_blue)
        prompt = TTY::Prompt.new
        selection = prompt.select("Do you want to play?".colorize(:light_blue)) do |menu|
            menu.choice name: "yes".colorize(:light_green), value: 1
            menu.choice name: "no, go back to adventures".colorize(:light_yellow), value: 2
        end
        if selection == 1
            puts "Arya says if you find her you'll get a prize!".colorize(:light_blue)
            sleep(2)
            puts "Let's go!".colorize(:light_blue)
            sleep (2)
            self.find_arya
        elsif selection == 2
            #have another option here?
            #return to castle or main adventure screen
            self.start_winterfell_adventure 
        end
    end

    def find_arya
        ##lower fatigue skill by 1
        prompt = TTY::Prompt.new
        selection = prompt.select("Where could Arya be?".colorize(:light_blue)) do |menu|
            menu.choice name: "Behind the pillar".colorize(:light_blue), value: 1
            menu.choice name: "Behind the tomb of Lyanna Stark".colorize(:light_blue), value: 2
            menu.choice name: "Behind the ironwood door".colorize(:light_blue), value: 3
        end
        if selection == 1
            puts "She is not there!".colorize(:light_red)
            sleep (2)
            self.find_arya #rerun to find arya
        elsif selection == 2
            puts "No one is there!".colorize(:light_red)
            sleep (2)
            self.raise_fatigue_skill
            self.find_arya #rerun to find arya
        elsif selection == 3
            puts "Hey #{UserAdventure.last.user.name}! You found me, nice job...".colorize(:light_green)
            sleep (2)
            puts "But that was too easy. You must first answer my question to get your prize.".colorize(:light_blue)
            sleep (2)
            self.arya_question##build another method => answer secret question if right give this item to user
            sleep (2)
        end
    end

    def arya_question
        prompt = TTY::Prompt.new
        question_array = [
            #question_array.sample[:question] to get random question back
            #get quesions related to 
            {"question": "Was Brandon Stark the first Stark?".colorize(:light_blue), "answer": "yes"},
            {"question": "Are there any Stark swords in the Iron Throne?".colorize(:light_blue), "answer": "no"}
        ]
        chosen_question = question_array.sample[:question]
        selection = prompt.select(chosen_question) do |menu|
            prompt = TTY::Prompt.new
            menu.choice name: "yes".colorize(:light_blue), value: 1
            menu.choice name: "no".colorize(:light_blue), value: 2
        end
        if chosen_question == question_array.first[:question] && selection == 1
            #Correct!
            ##store item with user
            puts "That is correct! Here is a golden dragon.".colorize(:light_green)
            sleep (2)
            self.raise_intelligence_skill
            puts "It's getting late, time to head back!".colorize(:light_blue)
            sleep (2)
            self.start_winterfell_adventure
        elsif chosen_question == question_array.second[:question] && selection == 2
            #Correct!
            ##store item with user
            puts "That is correct! Here is a golden dragon.".colorize(:light_green)
            sleep (2)
            self.raise_intelligence_skill
            puts "It's getting late, time to head back!".colorize(:light_blue)
            sleep (2)
            self.start_winterfell_adventure
        else
            puts "Sorry that is not correct.".colorize(:light_red)
            sleep (2)
            #try again method
            self.question_try_again
        end

    end

    def question_try_again
        prompt = TTY::Prompt.new
        selection = prompt.select("Would you like to try again?".colorize(:light_blue)) do |menu|
            prompt = TTY::Prompt.new
            menu.choice name: "yes".colorize(:light_green), value: 1
            menu.choice name: "no, go back to adventures".colorize(:light_yellow), value: 2
        end
        if selection == 1
           self.arya_question #to recall question method
        elsif selection == 2
            #exit to castle or adventure home screen??
            self.start_winterfell_adventure  #self.first.start ? was here before
        end
    end

end