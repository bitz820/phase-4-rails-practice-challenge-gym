class GymsController < ApplicationController
    def index
        render json: Gym.all, status: :ok
    end

    def show
        gym = find_gym
        render json: gym, status: :ok
    end
    
    def create
        gym = Gym.create!(gym_params)
        render json: gym, status: :created
    end

    def update
        gym = find_gym
        gym.update!(gym_params)
        render json: gym, status: :ok
    end

    def destroy
        gym = find_gym
        gym.destroy
        render json: {}, status: :ok
        head :no_content
    end

    private

    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.permit(:name, :address)
    end


end
