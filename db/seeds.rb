    
(0..10).each do |x|
    user = User.new({
        :email => "#{Faker::Internet.email}",
        :password => "my_name_is_jeff",
        :password_confirmation => "my_name_is_jeff"    
    })
    user.skip_confirmation!
    user.save!
end



threads = Commontator::Thread.all
users = User.all

(1..10).each do |x|
    forum = Forum.new({
        :title => Faker::Lorem.sentence,
        :description => Faker::Lorem.paragraph
    })
    forum.save!
    
    posts = (0..50).map do |i|
        post = Post.new(:title => Faker::Lorem.sentence, :body => Faker::Lorem.paragraph, :forum_id => forum.id, :user_id => 1)
        post.save!
        post
    end

    # posts.each do |p|
    #     comments = (0..5).map do |i|
    #         comment = Commontator::Comment.new(thread: p.commontator_thread, creator: User.first, body: Faker::Lorem.paragraph)           
    #         comment.save!
    #         comment
    #     end
    # end
end


Post.all.each do |p|
    User.all.each do |u|
        if rand(-1.0..1.0) > 0 
            p.liked_by u
            puts "like"
        end
    end
end