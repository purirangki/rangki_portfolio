class AddUserIdToStukTodoTasks < ActiveRecord::Migration
  def change
    add_column :stuk_todo_tasks, :user_id, :integer
  end
end
