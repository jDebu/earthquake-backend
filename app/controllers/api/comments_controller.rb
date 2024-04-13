class Api::CommentsController < ApiController
  def index
    @comments = Comment.where(earthquake_id: params[:earthquake_id])
  end
  
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:earthquake_id, :body, :user_id, :user_fullname)
  end
end
