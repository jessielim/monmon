class Monster < ApplicationRecord
	include PgSearch
	belongs_to :deck

	pg_search_scope :search_by_name, :against => :name

end