class UsersController < ApplicationController


    def create
        user = User.create(user_params)
        if user.valid?
        session[:user_id] = user.id # this is the piece that logs a user in and keeps track of users info in subsequent requests.
          render json: user, status: :created
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
      end
    # Here I just need to add an empty {} and status:  after it.
    def show
        user = User.find_by_id(session[:user_id])
        if user 
            render json: user
        else  
            render json:{}, status: :unauthorized
        end
      
    end






    private 
    #Need to confirm the Bcrypt is handling the creating of the salt and Bcrypt password in the baackground using the Gem Bcrypt and salting it convining password and password_confirmation and the storing it in the database under password_digest
    def user_params 
        params.permit(:username, :password, :password_confirmation)
    end

  
end
