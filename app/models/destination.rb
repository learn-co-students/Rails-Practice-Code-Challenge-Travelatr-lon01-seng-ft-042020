class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts

 #The destinations post with the most likes
 #Find all the likes on those posts
 #Find the maximum 
 def featured_post
    @all_posts = self.posts
    @most_liked = @all_posts.max_by{|post| post.likes}
  end

  def most_recent_posts
     @most_recent = self.posts.max_by(5) { |p| p.created_at }
  end

end
