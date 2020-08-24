class User < ApplicationRecord
    has_many :scheduled_pairs
    has_many :pairs, through: :scheduled_pairs
    # has_many :user_sprints
    # has_many :sprints, through: :user_sprints
end
