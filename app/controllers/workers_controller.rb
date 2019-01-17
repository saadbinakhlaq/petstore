class WorkersController < ApplicationController
  def create
    worker = WorkerForm.new(worker_params)

    if worker.valid?
      render :head, status: :created
    else
      render_error(worker.errors.messages, :unprocessable_entity)
    end
  end

  def destroy
    render :head, status: :ok
  end

  private

  def worker_params
    params.require(:worker).permit(
      :email
    )
  end
end