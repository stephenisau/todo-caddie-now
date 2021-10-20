class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.datetime :duedate

      t.timestamps
    end
  end
end
