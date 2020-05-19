class Destination < ApplicationRecord
    has_many :posts

    has_many :bloggers, through: :posts

    def featured_post
        self.posts.max_by{ |post| post.likes}
    end

    def recent_posts
        self.posts.max_by(5) { |post| post.created_at}
    end

    def average_age
        if self.bloggers.length > 0
            bloggers = self.bloggers.uniq
            total_age = bloggers.sum{|blogger| blogger.age}
            average = total_age.to_f / bloggers.length
            average.round(1)
        else
            average = 0
        end
    end

end
