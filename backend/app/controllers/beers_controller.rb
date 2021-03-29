class BeersController < ApplicationController
    before_action :find_user
    before_action :authorized

    def index
        @beers = @user.beers.find_by(id: params[:id])
        render json: @beers
    end

    def show
        @beer = @user.beers.find_by(id: params[:id])
        render json: @beer
    end

    def create
    end

    def update
    end

    def destroy
    end

    private

    def find_user
        @user = User.find_by(id: params[:user_id])
    end
end