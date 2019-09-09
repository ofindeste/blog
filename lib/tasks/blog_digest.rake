namespace :blog_digest do
  desc "TODO"
  task daily: :environment do
    User.all.each do |user|
      if user.daily?
        Post.where("created_at >= ?", 1.day.ago.utc).each do |post|
          digest = UserDigest.create(user: user, post: post)
          digest.save
        end
        unread_count = 0
        Post.where(user: user).each do |post|
          Comment.where(post: post).each do |comment|
            if comment.is_read == false
              unread_count += 1
            end
          end
        end
        MessageCounter.where(user: user).each do |mc|
          mc.destroy
        end
        MessageCounter.create(user: user, count: unread_count)
      end
    end
  end

  task weekly: :environment do
    User.all.each do |user|
      if user.weekly?
        Post.where("created_at >= ?", 1.week.ago.utc).each do |post|
          digest = UserDigest.create(user: user, post: post)
          digest.save
        end
        unread_count = 0
        Post.where(user: user).each do |post|
          Comment.where(post: post).each do |comment|
            if comment.is_read == false
              unread_count += 1
            end
          end
        end
        MessageCounter.where(user: user).each do |mc|
          mc.destroy
        end
        MessageCounter.create(user: user, count: unread_count)
      end
    end
  end
end
