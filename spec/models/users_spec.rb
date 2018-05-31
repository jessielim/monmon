require 'rails_helper'

RSpec.describe User, type: :model do

  context "validations" do

    # happy_path
    describe "can be created when all attributes are present" do
      When(:user) { User.create(
        first_name: "Raz",
        last_name: "Raz",
        email: "raz@nextacademy.com",
        password: "123456",
        password_confirmation: "123456"

      )}
      Then { user.valid? == true }
    end

    # unhappy_path
    describe "cannot be created without first_name" do
      When(:user) { User.create(last_name: "nextacademy", email: "josh@nextacademy.com", password: "123456", password_confirmation: "123456") }
      Then { 
        # byebug
        user.valid? == false }
    end

    describe "cannot be created without last_name" do
      When(:user) { User.create(first_name: "josh", email: "josh@nextacademy.com", password: "123456", password_confirmation: "123456") }
      Then { 
        # byebug
        user.valid? == false }
    end

    describe "cannot be created without a email" do
      When(:user) { User.create(first_name: "Josh Teng", last_name: "nextacademy", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end


    describe "cannot be created without a password" do
      When(:user) { User.create(first_name: "Josh Teng", last_name: "nextacademy", email: "josh@nextacademy.com") }
      Then { user.valid? == false }
    end

# happytest association
    describe User do
      it "should have many decks" do
        t = User.reflect_on_association(:decks)
        expect(t.macro).to eq(:has_many)
      end
    end

  end

end