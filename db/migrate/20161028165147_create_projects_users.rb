class CreateProjectsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :projects_users do |t|
      t.integer :project_id,  null: false
      t.integer :user_id,     null: false

      t.timestamps
    end
  end
end
