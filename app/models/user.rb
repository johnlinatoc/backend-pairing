class User < ApplicationRecord
    has_many :user_sprints
    has_many :sprints, :through => :user_sprints
end
