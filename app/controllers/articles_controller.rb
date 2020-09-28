class ArticlesController < ApplicationController

  before_action :authorize , only:[:new,:edit,:destroy,:update]

	def index
		@articles=Article.all
	end

  def new
  	@article=Article.new
  end

  def show
     @article=Article.find(params[:id])
   end

def destroy
	@article=Article.find(params[:id])

  if current_user.articles.include?(@article) || current_user.admin
    if @article.destroy
  redirect_to :action=>:index
  end
else
  redirect_to :action=>:index
 end
end

def edit
 @article=Article.find(params[:id])
 unless current_user.articles.include?(@article) || current_user.admin
   redirect_to action: :index
 end
end

def update
	@article=Article.find(params[:id])

  if @article.update(article_params)
  	redirect_to @article
end
 end


  def create
  	@article=Article.create(article_params)
    @article.user_id = current_user.id

  	if @article.save 
  		redirect_to @article

    else
      render 'new'
  	end
  end

def search
    if params[:search].blank?
      @articles=Article.all
    else
      @articles= Article.search(params)
  end
end
  private
  def article_params
  	params.require(:article).permit(:title,:body,:image)
  end



end
