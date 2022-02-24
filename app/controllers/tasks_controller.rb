# frozen_string_literal: true

# TasksController
class TasksController < ApplicationController
  before_action :find_task, only: %i[show update complete]

  def index
    @tasks = Task.where(completed: false)
    render json: @tasks
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

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def resource_params
    params.require(:task).permit(:name, :deadline)
  end
end
