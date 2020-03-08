class User < ApplicationRecord
  include Streakable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
  has_many :posts
  
  acts_as_commontator

  def current_streak_length_for_forum(forum_id)
    current_streak(days_posted_in_forum(forum_id)).count 
  end

  private 
  def streaks(days)
    # calucates all streaks for event.
    # When given a set of Date's of each day an event occured.
    streaks = []
    last_date = 0
    current_streak = []

    days.each do |date|
      if ((date - last_date) > 1)
            #end streak
        streaks << current_streak
        current_streak = []
      else
            # continue streak
            current_streak << date
      end
      last_date = date
    end
    streaks
  end    

    def current_streak(days)
        #streaks: [[Date]...]
        oldest = days.max
        streaks(days).each do |s|
            if s.include? oldest
                if (Date.new - oldest < 1)
                    return s 
                end
            end
        end
    end

  def days_posted_in_forum(forum_id)
    days = Set.new
    posts = self.posts.in_forum(forum_id)
    
    posts.each do |p|
      days << p.created_at.in_time_zone.to_date
    end
    days
  end

end
