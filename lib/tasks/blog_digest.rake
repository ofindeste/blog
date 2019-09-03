namespace :blog_digest do
  desc "TODO"
  task daily: :environment do
    User.all.each do |user|
      if user.daily?
        Post.where("created_at >= ?", 1.day.ago.utc).each do |post|
          digest = UserDigest.create(user: user, post: post)
          digest.save
        end
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
      end
    end
  end
end
