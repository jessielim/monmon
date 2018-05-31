require 'rails_helper'
describe "the signin process", type: :feature do
  before :each do
    User.create(first_name: "jane", last_name: "janie", email: 'user@example.com', password: 'password')
    Deck.create(deck_name: "Deck 1", user_id: "2")
  end

  it "signs me in" do
    visit '/sign_in'

      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'

    click_button 'Log in'
    expect(page).to have_content 'Welcome to Monmon'
  end
end