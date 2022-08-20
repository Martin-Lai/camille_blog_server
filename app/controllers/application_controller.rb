class ApplicationController < ActionController::API
  def handle_exception
    return render json: {message: "failure", error: e.message}, status: :bad_request
  end
end
