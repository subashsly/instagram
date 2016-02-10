class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  			flash[:success] = "Success!"
  			redirect_to post_path(@post)
  		else
  			flash[:error] = @post.erros.full_messages
  			redirect_to new_post_path
  		end
  end

  def index
  	@posts = Post.all
  end

  def show
  end

  def destroy
    # @post = Post.find(params[:id])
    @post.delete
    flash[:success] = "photo deleted"
    redirect_to new_post_path
 end

  private
  def post_params
  	params.require(:post).permit(:image, :description)
  end
end
