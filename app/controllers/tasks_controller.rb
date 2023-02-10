module v1
    class tasks_controller < ActionController::Base
        #add a controller action to return all tasks
        def index
            @tasks = Task.all
            render json: @tasks
        end
        #add a controller action to return a single task
        def show
            @task = Task.find(params[:id])
            render json: @task
        end
        #add a controller action to create a new task
        def create
            @task = Task.new(task_params)
            if @task.save
                render json: @task
            else
                render json: @task.errors, status: :unprocessable_entity
            end
        end

        #add a controller action to update a task
        def update
            @task = Task.find(params[:id])
            if @task.update(task_params)
                render json: @task
            else
                render json: @task.errors, status: :unprocessable_entity
            end
        end

        #add a controller action to delete a task 
        def destroy
            @task = Task.find(params[:id])
            @task.destroy
        end

        #add a controller action to return all tasks for a specific user
        def user_tasks
            @tasks = Task.where(user_id: params[:user_id])
            render json: @tasks
        end

        private
        #add a private method to define the parameters that can be passed to the controller
        def task_params
            params.require(:task).permit(:title, :description, :user_id)
        end
     end
end