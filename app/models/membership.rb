class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :client_id, uniqueness: {scope: :gym_id, message: "Membership already exists"}

  # validates :user_id, uniqueness: true
end
