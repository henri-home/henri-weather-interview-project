class Location < ApplicationRecord
  validates :zipcode, presence: true
  validates :zipcode, numericality: {message: "must only contain digits 0-9"}
  validates :zipcode, uniqueness: true
end
