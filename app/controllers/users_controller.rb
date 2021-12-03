class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create 
        user = User.create(user_params)
        if user.valid?
            render json: user, status: :created 
        else 
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
        end
    end

    def show
        user = User.find_by(id: session[:user_id])
        render json: user
    end






    private 
    #Need to confirm the Bcrypt is handling the creating of the salt and Bcrypt password in the baackground using the Gem Bcrypt and salting it convining password and password_confirmation and the storing it in the database under password_digest
    def user_params 
        params.permit(:username, :password, :password_confirmation)
    end

    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end
end
