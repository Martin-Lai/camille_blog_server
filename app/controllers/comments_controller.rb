class CommentsController < ApplicationController
  
  rescue_from StandardError, with: :handle_exception

  def index
    if !params[:serial_number]
      render json: {message: "failure", error: "serial_number error"}, status: :bad_request
      return
    end
    @comments = Comment.where(serial_number: params[:serial_number])
    render json: {message: "success", data: @comments}
  end

  def create
    comment_param = params.permit(:serial_number, :user_name, :message)
    @comment = Comment.new(comment_param)
    @comment.save!
    render json: {message: "success", data: @comment}
  end

end