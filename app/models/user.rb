class User < ActiveRecord::Base
    has_one :house
    has_many :skills
    has_many :characters, through: :house

    def self.login
        puts "Please login.  What is your character name?"
        name = gets.chomp
        puts "What is your password?"
        password = gets.chomp
        puts "Are you a boy or a girl?"
        gender = gets.chomp
        User.find_or_create_by(name: name, password: password, gender: gender)
    end

    def view_profile
        puts "Your character name is #{self.name}"
    end
end