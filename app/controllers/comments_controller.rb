class CommentsController < ApplicationController
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:success] = "Successfully deleted!"
        redirect_to root_url
    end
end
