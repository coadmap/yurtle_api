# frozen_string_literal: true
require 'rails_helper'

RSpec.describe TasksController, type: :request do
  describe 'GET /tasks' do
    subject(:request) { get tasks_path }
    let!(:tasks) { create_list(:task, 3) }

    it 'タスク一覧が取得できること' do
      request
      expect(response).to have_http_status(:ok)
      response_json = JSON.parse(response.body)
      expect(response_json.size).to eq 3
    end
  end

  describe 'POST /tasks' do
    subject(:request) { post tasks_path, params: params }
    let(:params) { { task: { name: '料理する', deadline: Date.tomorrow } } }

    it 'タスクを作成できること' do
      expect { request }.to change(Task, :count).by(+1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET /tasks/:id' do
    subject(:request) { get task_path(task.id) }
    let!(:task) { create(:task) }

    it 'タスクが取得できること' do
      request
      expect(response).to have_http_status(:ok)
      response_json = JSON.parse(response.body)
      expect(response_json['id']).to eq task.id
    end
  end

  describe 'PATCH /tasks/:id' do
    subject(:request) { patch task_path(task.id), params: params }
    let!(:task) { create(:task) }
    let(:params) { { task: { name: '食べる' } } }

    it 'タスクを更新できること' do
      request
      expect(response).to have_http_status(:ok)
      response_json = JSON.parse(response.body)
      expect(response_json['name']).to eq '食べる'
    end
  end

  describe 'POST /tasks/:id/complete' do
    subject(:request) { post complete_task_path(task.id) }
    let!(:task) { create(:task) }

    it 'タスク完了できること' do
      request
      expect(response).to have_http_status(:ok)
      response_json = JSON.parse(response.body)
      expect(response_json['completed']).to be_truthy
    end
  end
end
