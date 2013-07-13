module ArticlesHelper

	def latest_article
      @article = Article.order("created_at").last()
    end

    def recent_articles
    	@articles = Article.order("created_at desc").limit(3)
    end
end
