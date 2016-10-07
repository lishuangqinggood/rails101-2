class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.edit
   end
   def update
     @group = Group.find(params[:group_id])
     @post = Post.edit

    if @post.update(post_params)
      redirect_to account_posts_path, notice: "Update Success"
    else
      render :edit
    end
   end

   def destroy

     @post = Post.find(post_params)
       @post.destroy
       redirect_to account_posts_path, alert: "Post deleted"
    end

    private

     def post_params
       params.require(:post).permit(:content)
     end

end
