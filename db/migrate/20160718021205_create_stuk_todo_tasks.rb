class CreateStukTodoTasks < ActiveRecord::Migration
  def change
    create_table :stuk_todo_tasks do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
