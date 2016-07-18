json.array!(@stuk_todo_tasks) do |stuk_todo_task|
  json.extract! stuk_todo_task, :id, :content
  json.url stuk_todo_task_url(stuk_todo_task, format: :json)
end
