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
        @beer= @user.beers.build(beer_params)
        if @user.valid? && @beer.save
            render json: @beer
        else
            render json: {error: "We cant create that", status: 400}
        end
    end

    def update
        @beer = Beer.find_by_id(params[:id])
        if Beer.update(beer_params)
            render json: @beer
        else
            render json: {error: "You can't update that beer", status:400}
        end
    end

    def destroy
        @beer = Beer.find_by_id(params[:id])
        if @user.valid? && @beer
          @beer.destroy
          render json: { message: 'Beer was deleted'}, status: :accepted
        else
          render json: { error: 'Beer was not found'}, status: :not_acceptable
        end
    end

    def showAllBeers
        @beers = Beer.all
    end

    private

    def find_user
        @user = User.find_by(id: params[:user_id])
    end

    def user_params
        params.require(:user).permint(:name)
    end

    def beer_params
        params.require(:beer).permit(:name, :malt_type, :malt_amount, :hop_type, :hop_amount, :yeast_type, :yeast_amount, :water_ph, :water_amount, :user_id)
    end

end
