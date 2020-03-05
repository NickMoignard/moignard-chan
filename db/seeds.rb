(1..20).each do |x|
    Forum.new({
        :title => Faker::Lorem.sentence,
        :description => Faker::Lorem.paragraph
    }).save!
end    

(0..100).each do |x|
    user = User.new({
        :email => "#{Faker::Internet.email}",
        :password => "my_name_is_jeff",
        :password_confirmation => "my_name_is_jeff"    
    })
    user.skip_confirmation!
    user.save!

    forum = Forum.first

    post = Post.new({
        :user_id => user.id,
        :forum_id => forum.id,
        :title => Faker::Lorem.sentence,
        :body => Faker::Lorem.paragraph
    })
    post.save!
end

