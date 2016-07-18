class AddContentHtmlToStukTodoTasks < ActiveRecord::Migration
  def change
    add_column :stuk_todo_tasks, :content_html, :text
  end
end
