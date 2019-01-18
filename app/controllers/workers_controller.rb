class WorkersController < ApplicationController
  def create
    worker = WorkerForm.new(worker_params)

    if worker.valid?
      render json: {
        "worker": {
          id: 1,
          email: worker_params[:email],
          address: worker_params[:address]
        }
      }, status: :created
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
      :email,
      :address
    )
  end
end