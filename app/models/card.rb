class Card < ApplicationRecord
	has_one :monster
	belongs_to :deck
end