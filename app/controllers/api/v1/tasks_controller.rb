module Api
    module V1
        class TasksController <ApplicationController
            before_action :set_task, only: [ :show, :update, :destroy, :complete ]

            def index
                tasks = Task.all

                render json: TaskSerializer.new(tasks)
            end

            def show
                render json: TaskSerializer.new(task)
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
                if task.update(task_params)
                    render json: TaskSerializer.new(task)
                else
                    render json: { error: task.errors.messages }
                end
            end
            
            def destroy
                if task.destroy
                    head :no_content
                else
                    render json: { error: task.errors.messages }
                end

            end

            def complete
                if task.update(task_params)
                  redirect_to tasks_path, notice: 'Task marked as completed.'
                else
                  render :index, alert: "Failed to mark task as completed."
                end
            end

            private

            def set_task
                task = Task.find(params[:id])
            end

            def task_params
                params.require(:task).permit(:title, :description, :image_url, :repititions, :sets, :completed, :user_id, :category_id)
            end
        
        end
    end
end