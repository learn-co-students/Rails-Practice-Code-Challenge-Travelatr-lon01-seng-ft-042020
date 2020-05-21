class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts

#Should have unique names
#Ages above 0
#Bio should be over 30 characters long
validates :name, uniqueness: true
validates :age,  numericality: { greater_than: 0 }
validates :bio, length: { minimum: 31 }

 #The total likes on all of that blogger's posts
 #Find all the likes on those posts
 #sum the values
  def total_likes
    @all_posts = self.posts
    @all_posts.sum{|post| post.likes}
  end

 #The bloggers post with the most likes
 #Find all the likes on those posts
 #Find the maximum 
 def featured_post
    @all_posts = self.posts
    @most_liked = @all_posts.max_by{|post| post.likes}
  end

end
