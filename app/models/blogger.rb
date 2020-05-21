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
  def total_likes
  #Find all the bloggers posts
  #Find all the likes on those posts
  #sum the values
  end
  
end
