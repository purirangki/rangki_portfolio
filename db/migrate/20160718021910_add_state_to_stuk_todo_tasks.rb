class AddStateToStukTodoTasks < ActiveRecord::Migration
  def change
    add_column :stuk_todo_tasks, :state, :string, default: 'to_do'
  end
end
