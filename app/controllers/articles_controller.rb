class ArticlesController < ApplicationController
	# layout 'blog'
  http_basic_authenticate_with name: "demo", password: "demo", except: [:index, :show]
  helper_method :total_user 
	def index
		@articles = Article.all
	end
	def new
		@article=Article.new
	end
	def create

		 @article = Article.new(article_param)

		if @article.save
		redirect_to @article
		else
			render 'new'
		end
	end
	def edit
  	@article = Article.find(params[:id])
	end
	def show
		@article = Article.find(params[:id])
	end
	def total_user
	'hi to all'
	end

	def destroy
  	@article=Article.find(params[:id])
  	@article.destroy

  	redirect_to articles_path
  	end
	def update
  @article = Article.find(params[:id])
 
  if @article.update(article_param)
    redirect_to @article
  else
    render 'edit'
  end

end
	private def article_param
	params.require(:article).permit(:title, :text, :tags,:status )
	end
end
