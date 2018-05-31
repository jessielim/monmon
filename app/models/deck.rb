class Deck < ApplicationRecord
	has_many :monsters
	belongs_to :user

	validates :deck_name, presence: true
end