class UsersController < ApplicationController
    before_action :authorized, except: [:index, :create]
    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find_by(id: params[:id])
        render json: @user
    end

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token({user_id: user.id})
            render json: { user: user, jwt: token }, status: :created
        else
            render json: {error: "failed to create user"}, status: :not_acceptable
        end
    end

    def destroy
    end

    private
    def user_params
        params.require(:user).permit(:name, :password)
    end
end
