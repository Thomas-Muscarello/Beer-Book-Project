class AuthController < ApplicationController
    before_action :authorized, only: [:profile]

    def create
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {jwt: token, user: user}
        else
            render json: {error: "You are missing some information"}, status: :unauthorized
        end
    end

    def profile
        render json: @user
    end
    
end