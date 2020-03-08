class Post < ApplicationRecord
  belongs_to :forum
  belongs_to :user

  include Streakable
  
  acts_as_commontable
  acts_as_votable


  scope :in_forum, ->(forum_id){ where("forum_id = ?", forum_id) }
end
