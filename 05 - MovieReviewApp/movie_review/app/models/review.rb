class Review < ApplicationRecord
	belongs_to :user
	belongs_to :movie

  ratyrate_rateable "rating"
end
