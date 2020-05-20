class Blogger < ApplicationRecord
    has_many :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def featured_post
        @featured_post = self.posts.max_by do |post|
            post.likes
        end
        @featured_post
    end

    def total_likes
        self.posts.sum{|post| post.likes}
    end

end
