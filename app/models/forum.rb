class Forum < ActiveRecord::Base
    extend FriendlyId
    include Streakable
    has_many :posts

    friendly_id :title, use: :slugged
end

