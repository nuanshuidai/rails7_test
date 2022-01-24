class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dj", password: "dj", except: [:index, :show]
    before_action :set_post
    #创建新的评论
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        #comment = @post.comments.create! params.require(:comment).permit(:body)
        #CommentsMailer.submitted(comment).deliver_later
        redirect_to post_path(@post)
    end

    #删除评论
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post), status: 303
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body, :status)
        end

        def set_post
            @post = Post.find(params[:post_id])
        end

end
