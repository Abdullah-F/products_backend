class Promotion < ApplicationRecord
  has_and_belongs_to_many :products
  validates_uniqueness_of :code
  validates_presence_of :code, :active, :discount
end
