# app/models/reservation.rb
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :seats, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :seats_not_exceed_total_seats

  private

  def seats_not_exceed_total_seats
    if seats && trip && seats > trip.available_seats
      errors.add(:seats, "ne peut pas dépasser le nombre de places disponibles (#{trip.available_seats})")
    end
  end
end
