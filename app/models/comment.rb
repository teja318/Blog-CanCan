class Comment < ActiveRecord::Base
    belongs_to :user
	belongs_to :article
	validates_presence_of :title, :body, :article_id, :user_id
end
