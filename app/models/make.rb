class Make < ApplicationRecord
  # ASSOCIATIONS
  has_many :models
  accepts_nested_attributes_for :models, allow_destroy: true

  has_many :trims
  accepts_nested_attributes_for :trims, allow_destroy: true
end
