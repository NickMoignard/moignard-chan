class Forum < ApplicationRecord
    include Streakable
    has_many :posts
end
