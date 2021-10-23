Todo.destroy_all

Todo.create!([
    {title: "Buy milk", description: "Grocery store", completed: false, due_date: Date.today},
    {title: "Buy eggs", completed: false, due_date: Date.today},
    {title: "Buy bread", completed: false, due_date: Date.today},
])

puts "created #{Todo.count} todos"