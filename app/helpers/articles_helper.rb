module ArticlesHelper

	def latest_article
      @article = Article.order("created_at").last()
    end
end
