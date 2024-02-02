class Drone < ApplicationRecord
  has_one_attached :photo
  CATEGORY = %w[Racing Freestyle Cinematic Photography Other]

  belongs_to :user
  has_many :bookings

  validates :price, presence: true, numericality: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :time_in_air, presence: true, numericality: true
  validates :description, presence: true
  validates :weight, presence: true, numericality: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
end
