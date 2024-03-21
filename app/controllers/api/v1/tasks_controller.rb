module Api
    module V1
        class TasksController <ApplicationController
            before_action :set_task, only: [ :show, :update, :destroy, :complete ]

            def index
                tasks = current_user.tasks.order(id: :desc)

                render json: TaskSerializer.new(tasks)
            end

            def show
                render json: TaskSerializer.new(@task)
            end

            def create
                task = Task.new(task_params)
                
                if task.save
                    render json: TaskSerializer.new(task)
                else
                    render json: { error: task.errors.messages }
                end

            end

            def update
                if @task.update(task_params)
                    render json: TaskSerializer.new(@task)
                else
                    render json: { error: @task.errors.messages }
                end
            end
            
            def destroy
                if @task.destroy
                    head :no_content
                else
                    render json: { error: @task.errors.messages }
                end

            end

            def complete
                if @task.update(completed: !@task.completed)
                    message = @task.completed ? 'Task marked as completed' : 'Task marked as incomplete'
                    render json: { message: message, task: @task }
                else
                    render json: { message: "Failed to mark task as completed.", errors: @task.errors.full_messages }, status: :unprocessable_entity
                end
            end

            def index_category_tasks
                set_category
                tasks = @category.tasks.order(id: :desc)

                render json: TaskSerializer.new(tasks)
            end

            def due_today
                tasks = current_user.tasks.where(due_date: Date.today).order(id: :desc)
                render json: TaskSerializer.new(tasks)
            end

            private

            def set_task
                @task = current_user.tasks.find(params[:id])
            end

            def set_category
                @category = Category.find((params[:category_id]))
            end
              
            def task_params
                params.require(:task).permit(:title, :description, :image_url, :repetitions, :sets, :completed, :category_id, :due_date).merge(user_id: current_user.id)
            end
        
            def options
                @options ||= { include: [:categories]}
            end
        end
    end
end