class ScientistsController < ApplicationController
    before_action :find_scientist, only: [:show, :update, :destroy]

    def index
        render json: Scientist.all, status: :ok
    end

    def show
        render json: @scientist, serializer: ScientistPlanetSerializer, status: :ok
    end

    def create
        render json: Scientist.create!(scientist_params), status: :created
    end

    def update
        @scientist.update!(scientist_params)
        render json: @scientist, status: :accepted
    end

    def destroy
        @scientist.destroy
        head :no_content
    end



    private

    def find_scientist
        @scientist = Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end
end
