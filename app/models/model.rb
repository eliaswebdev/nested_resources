class Model < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :make
  has_many :trims
  accepts_nested_attributes_for :trims, allow_destroy: true
end
