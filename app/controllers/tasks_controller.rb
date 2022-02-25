# frozen_string_literal: true

# TasksController
class TasksController < ApplicationController
  before_action :find_task, only: %i[show update complete destroy]

  def index
    @tasks = Task.where(completed: false).order(:deadline)
    render json: @tasks, adapter: :json
  end

  def show
    render json: @task
  end

  def create
    @task = Task.create!(resource_params)
    render json: @task, status: :created
  end

  def update
    @task.update!(resource_params)
    render json: @task
  end

  def complete
    @task.update!(completed: true)
    render json: @task
  end

  def destroy
    @task.destroy!
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def resource_params
    params.require(:task).permit(:name, :deadline)
  end
end
