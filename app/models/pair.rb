class Pair < ApplicationRecord
  belongs_to :sprint
  has_many :scheduled_pairs
  has_many :users, through: :scheduled_pairs
end
