class Sprint < ApplicationRecord
  belongs_to :schedule
  has_many :user_sprints
  has_many :users, through: :user_sprints
end
