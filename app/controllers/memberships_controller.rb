class MembershipsController < ApplicationController

    def index
        render json: Membership.all, status: :ok
    end

    def show
        membership = find_membership
        render json: membership, status: :ok
    end
    
    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    def update
        membership = find_membership
        membership.update!(membership_params)
        render json: membership, status: :ok
    end

    def destroy
        membership = find_membership
        membership.destroy
        head :no_conent, status: :ok
    end

    private

    def find_membership
        Membership.find(params[:id])
    end

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end
end
