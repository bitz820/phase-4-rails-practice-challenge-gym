class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    def total_cost
        self.memberships.sum('charge')
    end
    
end
