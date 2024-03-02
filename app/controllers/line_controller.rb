class LineController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    tasks = Todoists::GetTasksFromProject.call
    message = BuildMessage::ListTasks.call(tasks:)
    user_id = ENV['DC_LINE_ID']
    Line::PushMessageJob.perform_later(user_id, [message])

    render json: { status: 'ok' }, Status: :ok
  end

  private

  def webhook_params
    params.permit
  end
end
