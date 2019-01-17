class WorkersController < ApplicationController
  def create
    render :head, status: :created
  end

  def destroy
    render :head, status: :ok
  end
end