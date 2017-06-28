class CommentsController < ApplicationController
  before_action :find_micropost, only: [:create]
  before_action :find_comment, only: [:destroy, :create]

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      render json: {status: :success, html: render_to_string(@comment)}
    else
      render json: {status: :error, error: "false"}
    end
  end

  def destroy
    if @comment.destroy
      render json: {status: :success,html: render_to_string(@comment)}
    end
  end

  private

  def find_micropost
    @micropost = Micropost.find_by id: params[:micropost_id]
  end

  def comment_params
    params[:comment].permit(:content, :micropost_id)
  end

  def find_comment
    @micropost = Micropost.find_by id: params[:micropost_id]
    @comment = @micropost.comments.find_by id: params[:id]
  end
end
