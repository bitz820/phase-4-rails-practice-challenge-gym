class ClientsController < ApplicationController
    def index
        render json: Client.all, status: :ok
    end

    def show
        client = find_client
        # byebug
        render json: client, status: :ok
    end
    
    def create
        client = Client.create!(client_params)
        render json: client, status: :created
    end

    def update
        client = find_client
        client.update!(client_params)
        render json: client, status: :ok
    end

    def destroy
        client = find_client
        client.destroy
        head :no_conent, status: :ok
    end

    private

    def find_client
        Client.find(params[:id])
    end

    def client_params
        params.permit(:name, :age, :total_cost)
    end



end
