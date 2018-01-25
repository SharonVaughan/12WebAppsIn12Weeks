class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Movie"
  belongs_to :rateable, :polymorphic => true
end
