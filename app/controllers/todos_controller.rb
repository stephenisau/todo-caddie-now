class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    @weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    @todos_by_month = @todos.group_by { |todo| todo.due_date.strftime("%B") }
    @todos_by_weekday = @todos.group_by { |todo| todo.due_date.strftime("%A") }

  end

  def show
    @todo = Todo.find(params[:id])
  end

  def get_by_weekday
    @month = todo_month_params['month']
    @month = DateTime.parse(todo_month_params['month'])
    @todos = Todo.due_by_month(todo_month_params['month'])
    puts @todos
    render 'month'
  end

  def get_by_month
    @date = todo_date_params['date']
    @todos = Todo.due_by_date(@date)
    puts @todos
    render 'date'
  end
  def new
    @todo = Todo.new
  end

  def create
    
    # get all the approrpiate date params
    @year = todo_params['due_date(1i)']
    @month = todo_params['due_date(2i)']
    @day = todo_params['due_date(3i)']
    @hour = todo_params['due_date(4i)']
    @minute = todo_params['due_date(5i)']

    @date_string = "#{@year}-#{@month}-#{@day} #{@hour}:#{@minute}:00"
    @todo = Todo.new do |t|
      t.title = todo_params['title']
      t.description = todo_params['description']
      t.due_date = @date_string
      t.completed = todo_params['completed'] == '1' ? true : false
    end
    
    if @todo.save
      redirect_to @todo
    else
      render ':new'
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    
    # get all the approrpiate date params
    @year = todo_params['due_date(1i)']
    @month = todo_params['due_date(2i)']
    @day = todo_params['due_date(3i)']
    @hour = todo_params['due_date(4i)']
    @minute = todo_params['due_date(5i)']

    @date_string = "#{@year}-#{@month}-#{@day} #{@hour}:#{@minute}:00"

    # construct the payload and update our database
    updated_todo = {
      'title' => todo_params['title'],
      'description' => todo_params['description'],
      'due_date' => @date_string,
      'completed' => todo_params['completed'] == '1' ? true : false
    }
    
    @todo = Todo.find(params[:id])
    if @todo.update(updated_todo)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to @todos
  end

  def due_date
    @todo
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :description, :due_date, :completed)
  end

  def todo_month_params
    params.permit(:month)
  end

  def todo_date_params
    params.permit(:date)
  end

end
