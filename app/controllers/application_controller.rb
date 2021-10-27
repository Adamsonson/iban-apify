class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_destroyed(data)
    render json: { errors: data.record.errors }, status: :unprocessable_entity
  end

  def not_found
    render json: { errors: 'Unable to find IBAN' }, status: :not_found
  end
end
