class UserSprint < ApplicationRecord
    belongs_to :sprint
    belongs_to :user
end
