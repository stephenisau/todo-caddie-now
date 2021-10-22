class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
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

  private
  def todo_params
    params.require(:todo).permit(:title, :description, :due_date, :completed)
  end

end
