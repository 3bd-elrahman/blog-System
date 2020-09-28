class CommentsController < ApplicationController

 before_action :authorize ,only:[:create]

 
	def create 
      @article=Article.find(params[:article_id])
      @comment=@article.comments.create(comment_param)
      @comment.user_id=current_user.id
      respond_to do |format|
      	if @comment.save
      		format.js
      	end
      end
	end

def destroy
	@article=Article.find(params[:article_id])
	@comment=Comment.find(params[:id])

if @article.user_id == current_user&.id || current_user&.admin ||@comment.user_id==current_user&.id
 
	 @comment.destroy

    respond_to do |format|
     # format.html { redirect_to @article, notice: 'Post was successfully destroyed.' }

      format.js
    end
end
end
	def comment_param
		params.require(:comment).permit(:body)
	end
end
