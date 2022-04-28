class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_message

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def invalid_message(invalid)
    render json: {errors: invalid.record.errors}, status: 422
  end

end
