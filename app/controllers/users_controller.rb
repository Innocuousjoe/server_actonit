# Path: app/controllers/users_controller.rb
# Compare this snippet from config/routes.rb:
# Rails.application.routes.draw do
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# 
#   # Defines the root path route ("/")
#   # root "articles#index"
#   # add routes for a model named tasks and wrap it in a v1 module
#   namespace :v1 do
#     resources :tasks
#   end
# end
module v1
    class users_controller < ActionController::Base
        #add a controller action to return all users
        def index
            @users = User.all
            render json: @users
        end
        #add a controller action to return a single user
        def show
            @user = User.find(params[:id])
            render json: @user
        end
        #add a controller action to create a new user
        def create
            @user = User.new(user_params)
            if @user.save
                render json: @user
            else
                render json: @user.errors, status: :unprocessable_entity
            end
        end

        #add a controller action to update a user
        def update
            @user = User.find(params[:id])
            if @user.update(user_params)
                render json: @user
            else
                render json: @user.errors, status: :unprocessable_entity
            end
        end

        #add a controller action to delete a user 
        def destroy
            @user = User.find(params[:id])
            @user.destroy
        end

        private
        #add a private method to define the parameters that can be passed to the controller
        def user_params
            params.require(:user).permit(:name, :email, :password)
        end
     end
    end
end