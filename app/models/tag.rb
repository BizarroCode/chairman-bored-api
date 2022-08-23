class Tag < ApplicationRecord
  has_many :games_tags
  has_many :games, through: :games_tags
end
