class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :tasks, id: :uuid, comment: 'タスク' do |t|
      t.string :name, null: false, comment: 'タスク名'
      t.boolean :completed, default: false, null: false, comment: '完了済みか'
      t.date :deadline, comment: '期限日'

      t.timestamps
    end
  end
end
