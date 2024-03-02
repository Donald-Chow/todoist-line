class LineController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    p params
  end

  private

  def webhook_params
    params.permit()
  end
end
