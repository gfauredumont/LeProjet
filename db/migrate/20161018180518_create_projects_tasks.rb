class CreateProjectsTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :projects_tasks do |t|
      t.integer :project_id,          null: false
      t.integer :task_id,             null: false

      t.timestamps
    end
  end
end
