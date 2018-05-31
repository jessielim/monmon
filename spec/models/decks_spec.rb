require 'rails_helper'

RSpec.describe Deck, :type => :model do

  context "validations" do

    # happy_path
    describe "can be created when all attributes are present" do
      When(:user){User.create(first_name:"Jane", last_name: "enaj", email:"jane@jane.com", password: "123456")}
      When(:deck) { Deck.create(
        deck_name: "pikachu",
        user_id: user.id
      )}
      Then { deck.valid? == true }
    end

    # unhappy_path
    describe "cannot be created without name" do
      When(:user){User.create(first_name:"Jane", last_name: "enaj", email:"jane@jane.com", password: "123456")}
      When(:deck) { Deck.create(user_id: user.id) }
      Then { 
        deck.valid? == false }
    end

  end

end