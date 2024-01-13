class Trip < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :comments
  has_many :users, through: :reservations
  validates :place, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def available_seats
    place - reservations.sum(:seats)
  end
  def average_rating
    comments_count = comments.count
    return 0 if comments_count.zero?

    comments.sum(:rating).to_f / comments_count
  end

  def self.search(origine, destination)
    if origine.present? && destination.present?
      where(origine: origine, destination: destination)
    elsif origine.present?
      where(origine: origine)
    elsif destination.present?
      where(destination: destination)
    else
      all
    end
  end
end
