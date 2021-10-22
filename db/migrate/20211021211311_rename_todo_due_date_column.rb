class RenameTodoDueDateColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :todos, :duedate, :due_date
  end
end
