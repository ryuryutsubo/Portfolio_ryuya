class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    user_ids = current_user.following_user.pluck(:id)
    user_ids.push(current_user.id)
    @post_images = PostImage.where(user_id: user_ids).order(created_at: :desc)
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  def ranking
    @post_images = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))
  end

  private

  def post_image_params
    params.require(:post_image).permit(:hint, :image, :quiz, :answer, :user)
  end
end
