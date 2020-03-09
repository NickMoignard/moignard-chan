class Post < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user

  include Streakable
  
  acts_as_commontable
  acts_as_votable

  default_scope ->{ order('cached_weighted_average DESC') }
  scope :in_forum, ->(forum_id){ where("forum_id = ?", forum_id) }
end
