class Article < ActiveRecord::Base
has_many :comments
has_many :article_categories
has_many :categories, through: :article_categories
 
belongs_to :user

validate :check_published_date
validate :check_title
validate :check_article

extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]


private
def check_published_date
	if self.published_date < Date.today
  self.errors.add(:published_date, " cannot be less than today" )
 end
end 

def check_title
 if (self.user.articles.length) >= 3 && (self.user.role? "author") 
 	self.errors.add(:user_id, "limit exceed (you can post only three artilces")

 #count = Article.where('user_id = ?', self.user_id).length 
 #if self.user.role? "author" 
 #if count>= 3
 #self.errors.add(:user_id, "limit not exceed")
 end
end

def check_article
	if self.categories.length >= 3
	self.errors.add(:cate, "limit exceed")
end	
end
end