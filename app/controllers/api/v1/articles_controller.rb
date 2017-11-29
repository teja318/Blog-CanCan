class Api::V1::ArticlesController < ApplicationController
  def index 
  	#sleep(1)
  	if params[:offset]
  		@articles = Article.offset(params[:offset]).limit(3)
  	end 
  	render json: {articles: @articles.map{|article| article.attributes.except!("body").merge(author: article.user.email, categories: "sports", formatted_date: article.published_date.strftime("%d %B %Y"), truncated_body: article.body.truncate(200))}}
  end	
end
